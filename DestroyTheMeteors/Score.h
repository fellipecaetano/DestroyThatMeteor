//
//  Score.h
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/13/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Score : SKNode

- (instancetype) init;
- (NSInteger) value;
- (void) setValue: (NSInteger) value;
- (void) incrementByAmount: (NSInteger) increment;
- (void) decrementByAmount: (NSInteger) decrement;

+ (NSString*) nodeName;

@end
