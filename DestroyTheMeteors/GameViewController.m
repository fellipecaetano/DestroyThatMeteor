//
//  GameViewController.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "GameViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SKView* view = (SKView*) self.view;
    view.showsFPS = YES;
    view.showsNodeCount = YES;
}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    SKView* view = (SKView*) self.view;
    
    if (!view.scene) {
        GameScene* scene = [[GameScene alloc] initWithSize: view.bounds.size];
        [view presentScene: scene];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
