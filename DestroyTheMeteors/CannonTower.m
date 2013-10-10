//
//  Cannon.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "CannonTower.h"
#import "Cannon.h"

static NSString* CANNON_NODE = @"cannon";

@implementation CannonTower

- (instancetype)init {
    self = [super initWithImageNamed: @"tower"];
    if (self) {
        Cannon* cannon = [[Cannon alloc] initWithImageNamed: @"cannon"];
        cannon.position = CGPointMake(12, 58);
        cannon.name = CANNON_NODE;
        cannon.zPosition = -1;
        [self addChild: cannon];
    }
    return self;
}

- (Cannon*) cannon {
    return (Cannon*) [self childNodeWithName: CANNON_NODE];
}

- (void)translateCannonTipWithVector:(CGVector)t descend:(BOOL)descend {
    [self.cannon translateTipWithVector: t descend: descend];
}

- (BOOL)nodeIsCannon:(SKNode *)node {
    return [node.name isEqualToString: CANNON_NODE];
}

@end
