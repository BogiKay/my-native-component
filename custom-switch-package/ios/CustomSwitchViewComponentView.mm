#if RCT_NEW_ARCH_ENABLED
#import "CustomSwitchViewComponentView.h"
#import <react/renderer/components/CustomSwitchPackage/ComponentDescriptors.h>
#import <react/renderer/components/CustomSwitchPackage/Props.h>
#import <react/renderer/components/CustomSwitchPackage/EventEmitters.h>
#import "CustomSwitchView.h"

#import "RCTFabricComponentsPlugins.h"


@implementation CustomSwitchViewComponentView {
    CustomSwitchView *_view;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        static const auto defaultProps = std::make_shared<const facebook::react::CustomSwitchComponentProps>();
        _props = defaultProps;
        
        CustomSwitchView *view = [CustomSwitchView new];
        [view addTarget:self action:@selector(onChange:) forControlEvents:UIControlEventValueChanged];
        self.contentView = (UIView *) view;
        _view = view;
        
    }
    
    return self;
}

- (void) onChange:(UISwitch *) sender {
    if (_eventEmitter != nil) {
        std::dynamic_pointer_cast<const facebook::react::CustomSwitchComponentEventEmitter>(_eventEmitter)->onValueChange(facebook::react::CustomSwitchComponentEventEmitter::OnValueChange { .value = sender.isOn });
    }
}

- (void) updateProps:(const facebook::react::Props::Shared &)props oldProps:(const facebook::react::Props::Shared &)oldProps {
    const auto &oldViewProps = *std::static_pointer_cast<facebook::react::CustomSwitchComponentProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<facebook::react::CustomSwitchComponentProps const>(props);
    
    if (oldViewProps.value != newViewProps.value) {
        [_view setOn:newViewProps.value];
    }
    [super updateProps:props oldProps:oldProps];
    
}
+ (facebook::react::ComponentDescriptorProvider)componentDescriptorProvider {
    return facebook::react::concreteComponentDescriptorProvider<facebook::react::CustomSwitchComponentComponentDescriptor>();
}

@end

Class<RCTComponentViewProtocol> CustomSwitchComponentCls(void) {
    return CustomSwitchViewComponentView.class;
}
#endif
