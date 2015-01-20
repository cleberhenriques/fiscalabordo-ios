//
//  FABUserManager.m
//  FiscalBus
//
//  Created by Cleber Henriques on 19/01/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "FABUserManager.h"
#import <PFFacebookUtils.h>

@implementation FABUserManager

+ (void)setFacebookInfo
{
    FBRequest *request = [FBRequest requestForMe];
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            PFUser *currentUser = [PFUser currentUser];
            NSDictionary *dictData = (NSDictionary *) result;
            
            currentUser[@"name"] = dictData[@"name"];
            currentUser[@"link"] = dictData[@"link"];
            currentUser[@"email"] = dictData[@"email"];
            
            [currentUser saveEventually];
        }
    }];
}

+ (void)linkFacebookUser
{
    NSArray *permissions = @[@"user_about_me"];
    
    if (![PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        [PFFacebookUtils linkUser:[PFUser currentUser] permissions:permissions block:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                [self setFacebookInfo];
            }
        }];
    }
}

+ (void)unlinkFacebookUser
{
    [PFFacebookUtils unlinkUserInBackground:[PFUser currentUser] block:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Unlink succeeded");
            PFUser *currentUser = [PFUser currentUser];
            currentUser[@"name"] = @"";
            currentUser[@"link"] = @"";
            [currentUser saveEventually];
        }else{
            NSLog(@"%@",error);
        }
    }];
    
}


@end
