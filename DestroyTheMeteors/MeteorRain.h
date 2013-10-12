//
//  MeteorRain.h
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/11/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@class Meteor;

@interface MeteorRain : NSObject

- (instancetype) init;
- (Meteor*) meteorForScene: (SKScene*) scene;
- (void) startInScene: (SKScene*) scene;

@end
