//
//  Seal.m
//  PeevedPenguins
//
//  Created by Rafael Adonay Tinajero San Emeterio on 23/05/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Seal.h"

@implementation Seal

- (id)init {
    self = [super init];
    
    if (self) {
        CCLOG(@"Seal created");
    }
    
   
    
    return self;
}

- (void)didLoadFromCCB {
    self.physicsBody.collisionType = @"seal";
}

@end
