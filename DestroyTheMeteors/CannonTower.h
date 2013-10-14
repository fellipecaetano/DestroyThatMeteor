//
//  Cannon.h
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Sprite.h"

@class Cannon, Bullet;

@interface CannonTower : Sprite

- (instancetype) init;

- (Cannon*) cannon;
- (void) pointTo: (CGPoint) location;
- (Bullet*) fireInNode: (SKNode*) node;
- (void) explodeInNode: (SKNode*) node;

@end
