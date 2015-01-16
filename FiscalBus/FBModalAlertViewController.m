//
//  FBModalAlertViewController.m
//  FiscalBus
//
//  Created by Cleber Henriques on 15/01/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "FBModalAlertViewController.h"

@interface FBModalAlertViewController ()

@end

@implementation FBModalAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonCancelarTouched:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
