#import "CustomSwitchViewManager.h"

@implementation CustomSwitchViewManager

RCT_EXPORT_MODULE(CustomSwitchComponent)

RCT_EXPORT_VIEW_PROPERTY(checked, BOOL)

RCT_EXPORT_VIEW_PROPERTY(onValueChange, RCTDirectEventBlock)



#if RCT_NEW_ARCH_ENABLED
#else
- (UIView *)view {
    return [[CustomSwitchView alloc] init];
}
#endif

@end
