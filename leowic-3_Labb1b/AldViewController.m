//
//  AldViewController.m
//  leowic-3_Labb1b
//
//  Created by Leonard Wickmark on 9/7/13.
//  Copyright (c) 2013 LTU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "AldViewController.h"
#import "AldMovingObjectView.h"
#import "AldMovingObject.h"

@interface AldViewController ()

@property (strong, nonatomic) AldMovingObjectView *canvas;
@property (strong, nonatomic) CADisplayLink *displayLink;
@property (nonatomic) CFTimeInterval lastDraw;
@property (strong, nonatomic) AldMovingObject *demoObject;

@end

@implementation AldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AldMovingObjectView *canvas;
    AldMovingObject *demoObject;
    CADisplayLink *displayLink;
    
    canvas = [[AldMovingObjectView alloc] initWithFrame:self.view.bounds];
    
    demoObject = [[AldMovingObject alloc] initWithBounds:canvas.bounds
                                             andPosition:CGPointMake(canvas.bounds.size.width * 0.5,
                                                                     canvas.bounds.size.height * 0.5)
                                                 andSize:CGSizeMake(50, 50)
                                              andTexture:nil];
    [demoObject setVelocity: 200];
    [demoObject setDirectionDeg:30];
    
    [canvas.sprites addObject:demoObject];
    
    displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(gameLoop)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    self.displayLink = displayLink;
    self.canvas = canvas;
    self.demoObject = demoObject;
    
    [self.view addSubview:canvas];
}

- (void)dealloc {
    self.displayLink = nil;
    self.demoObject = nil;
    self.canvas = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gameLoop {
    if (self.lastDraw == 0) {
        self.lastDraw = self.displayLink.timestamp;
        return;
    }
    
    CGFloat delta = (self.displayLink.timestamp - self.lastDraw);
    [self.demoObject update:delta];
    
    [self.canvas setRenderingDelta: delta];
    [self.canvas setNeedsDisplay];
    
    self.lastDraw = self.displayLink.timestamp;
}

@end
