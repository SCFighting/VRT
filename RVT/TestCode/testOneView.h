//
//  testOneView.h
//  RVT
//
//  Created by SC on 2020/1/10.
//  Copyright © 2020 SC. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface testOneView : BaseView
@property(nonatomic,copy)void ((^testBlock)(void));
@end

NS_ASSUME_NONNULL_END
