//
//  FBModalAlertViewController.h
//  FiscalBus
//
//  Created by Cleber Henriques on 15/01/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "FBRegistro.h"

@interface FBModalAlertViewController : UIViewController

@property (strong ,nonatomic) CLLocation *lastLocation;
@property (strong, nonatomic) FBRegistro *registro;

@end
