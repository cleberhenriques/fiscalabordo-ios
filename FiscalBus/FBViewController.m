//
//  ViewController.m
//  FiscalBus
//
//  Created by Cleber Henriques on 14/01/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "FBViewController.h"
#import "FBModalAlertViewController.h"
@interface FBViewController ()

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UILabel *labelVelocity;

@end

@implementation FBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    double speed = location.speed * 3.6;
    
    self.labelVelocity.text = [NSString stringWithFormat:@"%.0f km/h", speed];
}

- (IBAction)buttonReportTouched:(id)sender {
    FBModalAlertViewController *modalController = [self.storyboard instantiateViewControllerWithIdentifier:@"ModalAlertViewController"];
    [self presentViewController:modalController animated:YES completion:nil];
}
@end
