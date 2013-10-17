//
//  TowerNode.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/14/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "TowerArson.h"

@implementation TowerArson

+ (TowerArson *)towerArson {
    NSString* path = [[NSBundle mainBundle] pathForResource: @"TowerArson" ofType: @"sks"];
    SKEmitterNode* arson = [NSKeyedUnarchiver unarchiveObjectWithFile: path];
    return (TowerArson*) arson;
}

@end
