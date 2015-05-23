//
//  Gameplay.m
//  PeevedPenguins
//
//  Created by Rafael Adonay Tinajero San Emeterio on 23/05/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Gameplay.h"

@implementation Gameplay{
    CCPhysicsNode *_physicsNode;
    CCNode *_catapultArm;
}


// is called when CCB file has completed loading
- (void)didLoadFromCCB {
    // tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
        CCNode* _catapultArm = [CCBReader load:@"_catapultArm"];
}

// called on every touch in this scene
- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    [self launchPenguin];
}

- (void)launchPenguin {
    // loads the Penguin.ccb we have set up in Spritebuilder
    CCNode* penguin = [CCBReader load:@"Penguin"];
    // position the penguin at the bowl of the catapult
    penguin.position = ccpAdd(_catapultArm.position, ccp(16, 50));
    NSLog(@"catapultArm: x:%f y:%f", _catapultArm.position.x,_catapultArm.position.y);
    
    // add the penguin to the physicsNode of this scene (because it has physics enabled)
    [_physicsNode addChild:penguin];
    
    // manually create & apply a force to launch the penguin
    CGPoint launchDirection = ccp(1, 0);
    CGPoint force = ccpMult(launchDirection, 8000);
    [penguin.physicsBody applyForce:force];
}

@end
