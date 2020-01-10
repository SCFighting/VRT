//
//  HomeController.m
//  RVT
//
//  Created by SC on 2019/3/28.
//  Copyright © 2019 SC. All rights reserved.
//

#import "HomeController.h"
#import "TestController.h"

@implementation HomeController
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    TestController *vc = [[TestController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
