//
//  AppDelegate.h
//  RVT
//
//  Created by SC on 2019/3/27.
//  Copyright © 2019 SC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer API_AVAILABLE(ios(10.0));

- (void)saveContext;


@end

