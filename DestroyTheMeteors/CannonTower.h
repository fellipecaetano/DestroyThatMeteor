//
//  Cannon.h
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class Cannon;

@interface CannonTower : SKSpriteNode

- (instancetype) init;

- (Cannon*) cannon;
- (BOOL) nodeIsCannon: (SKNode*) node;
- (void) pointTo: (CGPoint) location;

@end
