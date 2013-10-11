//
//  Bullet.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "Bullet.h"

@implementation Bullet

- (instancetype)init {
    self = [super initWithColor: [SKColor blackColor] size: CGSizeMake(5, 5)];
    return self;
}

@end
