//
//  FABUserManager.h
//  FiscalBus
//
//  Created by Cleber Henriques on 19/01/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import <Parse/Parse.h>

@interface FABUserManager : PFObject

+ (void)setFacebookInfo;
+ (void)linkFacebookUser;
+ (void)unlinkFacebookUser;

@end
