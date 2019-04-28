//
//  BaseController.m
//  RVT
//
//  Created by SC on 2019/3/28.
//  Copyright © 2019 SC. All rights reserved.
//

#import "BaseController.h"
#import <GLKit/GLKit.h>
#import <OpenGLES/ES3/gl.h>
@interface BaseController ()

@end

@implementation BaseController

-(void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:UIColor.whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
