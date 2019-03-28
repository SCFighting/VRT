//
//  RootViewController.m
//  RVT
//
//  Created by SC on 2019/3/28.
//  Copyright © 2019 SC. All rights reserved.
//

#import "RootViewController.h"
#import "HomeController.h"
#import "FunctionController.h"
#import "CommunityController.h"
#import "MineController.h"
#import "RecordController.h"
#import "Tabbar.h"

@interface RootViewController()
@property (nonatomic , strong ) Tabbar *tabbar;
@end

@implementation RootViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 首页
    HomeController *homeVC = [[HomeController alloc]init];
    [self setViewController:homeVC title:@"首页" image:@"TB_home_normal" selectImage:@"TB_home_press"];
    // 功能
    FunctionController *funcVC = [[FunctionController alloc]init];
    [self setViewController:funcVC title:@"功能" image:@"TB_function_normal" selectImage:@"TB_function_press"];
    // 社区
    CommunityController *commVC = [[CommunityController alloc]init];
    [self setViewController:commVC title:@"社区" image:@"TB_community_normal" selectImage:@"TB_community_press"];
    // 我的
    MineController *mineVC = [[MineController alloc]init];
    [self setViewController:mineVC title:@"我的" image:@"TB_mine_normal" selectImage:@"TB_mine_press"];
    
    self.tabbar = [[Tabbar alloc]initWithCenterImage:@"homePage_saoyisao" selectImage:@"homePage_saoyisao" target:self action:@selector(CenterButtonClick)];
    [self setValue:self.tabbar forKey:@"tabBar"];
}

- (void)CenterButtonClick {
    RecordController *centerVC = [[RecordController alloc]init];
    [self presentViewController:centerVC animated:YES completion:nil];
}

#pragma mark - 添加子控制器
-(void)setViewController:(UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage {
    static NSInteger index = 0;
    viewController.tabBarItem.title = title;
    viewController.title = title;
    viewController.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.tag = index;
    index++;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    [self addChildViewController:nav];
}

@end
