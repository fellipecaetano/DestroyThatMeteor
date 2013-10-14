//
//  Meteor.h
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/11/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Sprite.h"

@interface Meteor : Sprite

- (instancetype) init;
- (void) explodeInNode: (SKNode*) node;

@end
