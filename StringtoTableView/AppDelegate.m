//
//  AppDelegate.m
//  StringtoTableView
//
//  Created by hakozaki on 2014/12/15.
//  Copyright (c) 2014年 hakozaki. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MagicalRecord.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [MagicalRecord setupCoreDataStack];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  }

- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}

- (void)applicationWillTerminate:(UIApplication *)application {
}



@end
