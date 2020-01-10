//
//  TestController.m
//  RVT
//
//  Created by SC on 2020/1/10.
//  Copyright © 2020 SC. All rights reserved.
//

#import "TestController.h"
#import "testOneView.h"
#import "testTwoView.h"
@interface TestController ()
@property(nonatomic,strong)testOneView *oneView;
@property(nonatomic,strong)testTwoView *twoView;
@end

@implementation TestController

-(void)loadView
{
    [super loadView];
    [self.view addSubview:self.oneView];
    [self.view addSubview:self.twoView];
    [self.oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    [self.twoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.oneView.mas_bottom);
        make.size.mas_equalTo(self.oneView);
        make.centerX.mas_equalTo(self.oneView);
    }];
}

-(testOneView *)oneView
{
  
    if (_oneView == nil) {
        _oneView = [[testOneView alloc] init];
        [_oneView setBackgroundColor:UIColor.redColor];
        @WeakObj(self);
        [_oneView setTestBlock:^{
            @StrongObj(self);
            NSLog(@"one---------------___.%@",NSStringFromClass([self class]));
            [self.twoView setTestBlock:^{
                NSLog(@"two");
                @StrongObj(self);
                NSLog(@"%@",NSStringFromClass([self class]));
            }];
        }];
    }
    return _oneView;
}

-(testTwoView *)twoView
{
    if (_twoView == nil) {
        _twoView = [[testTwoView alloc] init];
        [_twoView setBackgroundColor:UIColor.yellowColor];
    }
    return _twoView;
}
@end
