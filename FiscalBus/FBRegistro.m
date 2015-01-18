//
//  FBRegistro.m
//  FiscalBus
//
//  Created by Cleber Henriques on 17/01/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "FBRegistro.h"

@implementation FBRegistro

@dynamic User;
@dynamic broke;
@dynamic company;
@dynamic crowded;
@dynamic badSanitized;
@dynamic fast;
@dynamic location;
@dynamic plataform;
@dynamic velocity;
@dynamic noBelt;

+(NSString *)parseClassName
{
    return @"Registro";
}



- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.broke = NO;
        self.crowded = NO;
        self.badSanitized = NO;
        self.noBelt = NO;
        self.fast = NO;
    }
    
    return self;
}

@end
