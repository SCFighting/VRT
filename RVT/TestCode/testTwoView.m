//
//  testTwoView.m
//  RVT
//
//  Created by SC on 2020/1/10.
//  Copyright © 2020 SC. All rights reserved.
//

#import "testTwoView.h"

@implementation testTwoView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    if (_testBlock) {
        _testBlock();
    }
}

@end
