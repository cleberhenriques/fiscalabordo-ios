//
//  FBModalAlertViewController.m
//  FiscalBus
//
//  Created by Cleber Henriques on 15/01/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "FABModalAlertViewController.h"
#import "PFFacebookUtils.h"
#import "FABUserManager.h"

@interface FABModalAlertViewController ()

@property (weak, nonatomic) IBOutlet UITextField *companyName;
@property (weak, nonatomic) IBOutlet UIView *itemsContainer;
@property (weak, nonatomic) IBOutlet UILabel *labelVelocity;
@property (weak, nonatomic) IBOutlet UISwitch *identifySwitch;

@end

@implementation FABModalAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self additemsView];
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];
    self.labelVelocity.text = [NSString stringWithFormat:@"%.0f km/h", self.lastLocation.speed * 3.6];
    
    
    if ([PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        [self.identifySwitch setOn:YES animated:NO];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)identifyTouched:(UISwitch *)sender
{
    if (sender.isOn) {
        [FABUserManager linkFacebookUser];
    }else{
        [FABUserManager unlinkFacebookUser];
    }
    
}
- (IBAction)buttonCancelarTouched:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)buttonAlertarTouched:(id)sender
{
    if ([self.companyName.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ops"
                                                        message:@"Você deve informar o nome da empresa."
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }else{
        self.registro.location = [PFGeoPoint geoPointWithLatitude:self.lastLocation.coordinate.latitude
                                                        longitude:self.lastLocation.coordinate.longitude];
        
        self.registro.company = self.companyName.text;
        self.registro.velocity = [NSString stringWithFormat:@"%.0f km/h", self.lastLocation.speed * 3.6];
        self.registro.User = [PFUser currentUser];
        [self.registro saveInBackground];
        
        
        UIAlertView *alertSuccess = [[UIAlertView alloc] initWithTitle:@"Registro feito!" message:@"Obrigado por fazer a denúncia. Desejamos a você uma excelente viagem." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alertSuccess show];
        
    }
}

- (void)handleSingleTap:(id)sender
{
    [self.view endEditing:YES];
}

- (void)addConstraintsToView:(UIView *)view beFullScreenOfView:(UIView *)parent
{
    [parent addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                       attribute:NSLayoutAttributeWidth
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:parent
                                                       attribute:NSLayoutAttributeWidth
                                                      multiplier:1.0
                                                        constant:0]];
    
    // Height constraint, half of parent view height
    [parent addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                       attribute:NSLayoutAttributeHeight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:parent
                                                       attribute:NSLayoutAttributeHeight
                                                      multiplier:1.0
                                                        constant:0]];
    
    // Center horizontally
    [parent addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                       attribute:NSLayoutAttributeCenterX
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:parent
                                                       attribute:NSLayoutAttributeCenterX
                                                      multiplier:1.0
                                                        constant:0.0]];
    
    // Center vertically
    [parent addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                       attribute:NSLayoutAttributeCenterY
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:parent
                                                       attribute:NSLayoutAttributeCenterY
                                                      multiplier:1.0
                                                        constant:0.0]];
}


- (void)additemsView
{
    NSString *viewName;
    if ([[self selectedItems] count] > 0) {
        viewName = [NSString stringWithFormat:@"%luItemsHolder", (unsigned long)[[self selectedItems] count]];
    }
    
    UIView *itemsView = [[[NSBundle mainBundle] loadNibNamed:viewName owner:self options:nil] objectAtIndex:0];
    
    int i = 0;
    
    for (UIImageView *image in itemsView.subviews) {
        [image setImage:[UIImage imageNamed:[[self selectedItems] objectAtIndex:i]]];
        i++;
    }
    
    [self.itemsContainer addSubview:itemsView];
    [self addConstraintsToView:itemsView beFullScreenOfView:self.itemsContainer];
}

- (NSArray *)selectedItems
{
    NSMutableArray *selectedItems = [[NSMutableArray alloc]  init];
    if (self.registro.badSanitized) {
        [selectedItems addObject:@"BUG"];
    }
    
    if (self.registro.crowded) {
        [selectedItems addObject:@"STAND"];
    }
    
    if (self.registro.noBelt) {
        [selectedItems addObject:@"BELT"];
    }
    
    if (self.registro.broke) {
        [selectedItems addObject:@"BROKE"];
    }
    
    if (self.registro.fast) {
        [selectedItems addObject:@"VELOCITY"];
    }
    return selectedItems;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView.title hasPrefix:@"Registro"]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
