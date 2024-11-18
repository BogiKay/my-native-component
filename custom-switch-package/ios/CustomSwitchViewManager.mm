#import "CustomSwitchViewManager.h"

@implementation CustomSwitchViewManager {
    CustomSwitchView *_view;
}

RCT_EXPORT_MODULE(CustomSwitchComponent)

RCT_EXPORT_VIEW_PROPERTY(checked, BOOL)

RCT_EXPORT_VIEW_PROPERTY(onValueChange, RCTDirectEventBlock)



#if RCT_NEW_ARCH_ENABLED
#else
- (UIView *)view {
    _view = [[CustomSwitchView alloc] init];
    
    [_view addTarget:self action:@selector(onChange:) forControlEvents:UIControlEventValueChanged];
    return _view;
}

- (void) onChange:(UISwitch *) sender {
    _view.onValueChange(@{ @"value": @(sender.isOn) });
}
#endif

@end
