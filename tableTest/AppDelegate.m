//
//  AppDelegate.m
//  tableTest
//
//  Created by Sergey Urazov on 26/11/15.
//  Copyright © 2015 Sergey Urazov. All rights reserved.
//

#import "AppDelegate.h"
#import <MagicalRecord/MagicalRecord.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupAutoMigratingCoreDataStack];
    self.window = [UIWindow new];
    self.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
