#import "TestPlPlugin.h"
#if __has_include(<test_pl/test_pl-Swift.h>)
#import <test_pl/test_pl-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "test_pl-Swift.h"
#endif

@implementation TestPlPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTestPlPlugin registerWithRegistrar:registrar];
}
@end
