//
//  TestController.h
//  RVT
//
//  Created by SC on 2019/5/9.
//  Copyright © 2019 SC. All rights reserved.
//

#import "BaseController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestController : BaseController
@property (nonatomic  ,  copy ) NSString *str;
- (void)method2:(NSString **)obj;
@end

NS_ASSUME_NONNULL_END
