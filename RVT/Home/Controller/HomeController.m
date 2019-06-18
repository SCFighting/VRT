//
//  HomeController.m
//  RVT
//
//  Created by SC on 2019/3/28.
//  Copyright © 2019 SC. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()
@property (nonatomic  ,  copy ) NSString *str ;
@end

@implementation HomeController

-(instancetype)init
{
    if (self = [super init]) {
        _str = NSStringFromClass([self class]);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%@str指针地址=%p,str=%@",NSStringFromClass([self class]),&_str,_str);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    TestController *vc = [[TestController alloc] init];
   
    vc.str = NSStringFromClass([self class]);
    NSString *tt;
    [vc method2:&tt];
    NSLog(@"tt=%@",tt);
    [self.navigationController pushViewController:vc animated:YES];
}

@end
