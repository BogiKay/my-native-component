#if RCT_NEW_ARCH_ENABLED
#import <React/RCTViewComponentView.h>

@interface CustomSwitchViewComponentView : RCTViewComponentView

@property(nonatomic, assign) BOOL value;

//@property(nonatomic, copy) void (^ _Nullable onValueChange)(NSDictionary * _Nullable);

@end
#else
#endif
