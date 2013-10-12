//
//  MathUtils.h
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/12/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathUtils : NSObject

+ (CGFloat) randomNumberBetweenLowerLimit: (CGFloat) lower andUpperLimit: (CGFloat) upper;
+ (NSUInteger) conjunctionOfBitMasks: (NSArray*) masks;

@end
