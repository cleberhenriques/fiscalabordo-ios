//
//  AppDelegate.m
//  FiscalBus
//
//  Created by Cleber Henriques on 14/01/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "FABRegistro.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self initializeParseWithOptions:launchOptions];
    
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

- (void)initializeParseWithOptions:(NSDictionary *)launchOptions
{
    [FABRegistro registerSubclass];
    
    
    [PFUser enableAutomaticUser];
    PFACL *defaultACL = [[PFACL alloc] init];
    [defaultACL setPublicReadAccess:YES];
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
    
    [Parse setApplicationId:@"BH64VIC5VgSfnpAZ0k24q2XghUszuUjnleslRZag"
                  clientKey:@"pTyDW3oMjr6FcPoZAEAH0rfxMpfD6luPNM2CSSwX"];
    
    
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
}

@end
