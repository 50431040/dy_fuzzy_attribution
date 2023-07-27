#import "DyFuzzyAttributionPlugin.h"
#if __has_include(<dy_fuzzy_attribution/dy_fuzzy_attribution-Swift.h>)
#import <dy_fuzzy_attribution/dy_fuzzy_attribution-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "dy_fuzzy_attribution-Swift.h"
#endif

@implementation DyFuzzyAttributionPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDyFuzzyAttributionPlugin registerWithRegistrar:registrar];
}
@end
