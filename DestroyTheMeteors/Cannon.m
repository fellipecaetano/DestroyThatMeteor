//
//  Cannon.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "Cannon.h"

static NSString* TIP_NODE = @"tip";

@implementation Cannon

- (instancetype) init {
    self = [[Cannon alloc] initWithImageNamed: @"cannon"];
    if (self) {
        self.anchorPoint = CGPointMake(0, 0);
        
        SKNode* node = [[SKNode alloc] init];
        node.name = TIP_NODE;
        node.position = CGPointMake(self.size.width, self.size.height/2);
        [self addChild: node];
    }
    return self;
}

- (void)rotateToAngle:(CGFloat)angle {
    self.angle = angle;    
    SKAction* rotate = [SKAction rotateToAngle: angle duration: 0.1];
    [self runAction: rotate];
}

- (SKNode *)tip {
    return [self childNodeWithName: TIP_NODE];
}

@end
