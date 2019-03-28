//
//  Tabbar.h
//  RVT
//
//  Created by SC on 2019/3/28.
//  Copyright © 2019 SC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tabbar : UITabBar
@property (strong, nonatomic) UIButton *centerButton;
- (instancetype)initWithCenterImage:(NSString *)centerImage selectImage:(NSString *)selectImage target:(id)target action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
