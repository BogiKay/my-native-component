//
//  CustomSwitchView.m
//  CustomSwitchPackage
//
//  Created by Bogusz Kaszowski on 15/11/2024.
//

#import "CustomSwitchView.h"

@implementation CustomSwitchView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    return self;
}

- (void) setValue:(BOOL)value {
    [super setOn:value];
}


@end
