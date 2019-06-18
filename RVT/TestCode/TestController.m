//
//  TestController.m
//  RVT
//
//  Created by SC on 2019/5/9.
//  Copyright © 2019 SC. All rights reserved.
//

#import "TestController.h"

@interface TestController ()

@end

@implementation TestController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColor.redColor];
    NSLog(@"%@str指针地址=%p,str=%@",NSStringFromClass([self class]),&_str,_str);
    _str = NSStringFromClass([self class]);
    NSLog(@"修改后%@str指针地址=%p,str=%@",NSStringFromClass([self class]),&_str,_str);
    // Do any additional setup after loading the view.
}

- (void)method2:(NSString **)obj
{
    *obj = NSStringFromClass([self class]);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
