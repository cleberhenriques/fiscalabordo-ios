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
#import <Facebook-iOS-SDK/FacebookSDK/FacebookSDK.h>
#import "PFFacebookUtils.h"

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

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[PFFacebookUtils session] close];
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
    
    [PFFacebookUtils initializeFacebook];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
}

@end
