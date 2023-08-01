import Flutter
import UIKit
import AppTrackingTransparency
import AdSupport
import Network
import Foundation
import WebKit

public class SwiftDyFuzzyAttributionPlugin: NSObject, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "dy_fuzzy_attribution", binaryMessenger: registrar.messenger())
        let instance = SwiftDyFuzzyAttributionPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch(call.method) {
        case "getIOSStartTime":
            getIOSStartTime(result)
        case "getIOSystemUpdateTime":
            getIOSSystemUpdateTime(result)
        case "getUserAgent":
            getUserAgent(result)
        case "getIDFA":
            getIDFA(result)
        case "getPlatform":
            getPlatform(result)
        case "getIP":
            getIP(result)
        default:
            result(nil)
        }
    }
    
    // 获取启动时间
    private func getIOSStartTime(_ result: @escaping FlutterResult) {
        
        var mib = [ CTL_KERN, KERN_BOOTTIME ]
        var bootTime = timeval()
        var bootTimeSize = MemoryLayout<timeval>.size
        
        if sysctl(&mib, UInt32(mib.count), &bootTime, &bootTimeSize, nil, 0) < 0 {
            result(nil)
        }
        
        result(bootTime.tv_sec)
    }
    
    // 获取系统更新时间
    private func getIOSSystemUpdateTime(_ result: @escaping FlutterResult) {
        let infomation = "L3Zhci9tb2JpbGUvTGlicmFyeS9Vc2VyQ29uZmlndXJhdGlvblByb2ZpbGVzL1B1YmxpY0luZm8vTUNNZXRhLnBsaXN0"
        let data = NSData.init(base64Encoded: infomation, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
        let dataString = String.init(data: data! as Data, encoding: .utf8)
        
        do {
            let fileAttributes: Dictionary = try FileManager.default.attributesOfItem(atPath: dataString!)
            
            let singleAttribute = fileAttributes[FileAttributeKey.creationDate]
            
            if singleAttribute is NSDate {
                let date: NSDate = singleAttribute as! NSDate
                result(String(format: "%.6f", arguments: [date.timeIntervalSince1970]))
            } else {
                result(nil)
            }
        } catch _ {
            result(nil)
        }
    }
    
    // 获取UA
    private func getUserAgent(_ result: @escaping FlutterResult) {
        let webView = WKWebView(frame: CGRectZero)
        result(webView.value(forKey: "userAgent"));
    }
    
    private func getIDFAValue() -> String {
        return String(ASIdentifierManager.shared().advertisingIdentifier.uuidString)
    }
    
    // 获取IDFA
    private func getIDFA(_ result: @escaping FlutterResult) {
        // iOS14 及之后
        if #available(iOS 14, *) {
            // 已授权
            if ATTrackingManager.trackingAuthorizationStatus == ATTrackingManager.AuthorizationStatus.authorized {
                result(getIDFAValue())
                return
            }
            
            // 申请权限
            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                if status == ATTrackingManager.AuthorizationStatus.authorized {
                    result(self.getIDFAValue())
                } else {
                    result(nil)
                }
            })
            
            return
        }
        
        // iOS14以前
        if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
            result(getIDFAValue())
            return
        }
        
        result(nil)
    }
    
    // 获取设备编码
    private func getPlatform(_ result: @escaping FlutterResult) {
        var size = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0,  count: size)
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        result(String(cString: machine))
    }
    
    // 获取IP
    private func getIP(_ result: @escaping FlutterResult) {
        var address: String?
        
        // Get list of all interfaces on the local machine:
        var ifaddr: UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return result(nil) }
        guard let firstAddr = ifaddr else { return result(nil) }
        
        // For each interface ...
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee
            
            // Check for IPv4 or IPv6 interface:
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                
                // Check interface name:
                let name = String(cString: interface.ifa_name)
                if name == "pdp_ip0" || name == "ipv4" || name == "ipv6" {
                    
                    // Convert interface address to a human readable string:
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                &hostname, socklen_t(hostname.count),
                                nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                }
            }
        }
        freeifaddrs(ifaddr)
        
        result(address)
    }
}
