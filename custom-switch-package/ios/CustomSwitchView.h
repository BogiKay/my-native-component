//
//  CustomSwitchView.h
//  CustomSwitchPackage
//
//  Created by Bogusz Kaszowski on 15/11/2024.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface CustomSwitchView : UISwitch

@property(nonatomic, assign) BOOL value;

@property(nonatomic, copy) void (^ _Nullable onValueChange)(NSDictionary * _Nullable);

@end

NS_ASSUME_NONNULL_END
