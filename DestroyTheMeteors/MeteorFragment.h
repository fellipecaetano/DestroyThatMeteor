//
//  MeteorFragment.h
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/12/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MeteorFragment : SKSpriteNode

+ (NSString*) nodeName;
+ (NSUInteger) physicsCategory;

- (instancetype) init;

@end
