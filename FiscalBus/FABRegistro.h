//
//  FBRegistro.h
//  FiscalBus
//
//  Created by Cleber Henriques on 17/01/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FABRegistro : PFObject <PFSubclassing>

@property (strong ,nonatomic) PFUser *User;
@property (nonatomic, assign) BOOL broke;
@property (strong, nonatomic) NSString *company;
@property (assign, nonatomic) BOOL crowded;
@property (assign, nonatomic) BOOL badSanitized;
@property (strong, nonatomic) NSString *plataform;
@property (strong, nonatomic) NSString *velocity;
@property (nonatomic, assign) BOOL noBelt;
@property (nonatomic, assign) BOOL fast;
@property (strong, nonatomic) PFGeoPoint *location;

@end
