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
    
    self.canvas = [[AldMovingObjectView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.canvas];
    
    self.demoObject = [[AldMovingObject alloc] initWithBounds:self.view.bounds
                                                  andPosition:CGPointMake(self.canvas.bounds.size.width * 0.5,
                                                                          self.canvas.bounds.size.height * 0.5)
                                                      andSize:CGSizeMake(50, 50)
                                                   andTexture:nil];
    [self.demoObject setVelocity: 3];
    [self.demoObject setDirectionRad:2  5*3.141592/180.0];
    [self.canvas.sprites addObject:self.demoObject];
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(gameLoop)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
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
    
    CGFloat delta = (self.displayLink.timestamp - self.lastDraw) / 0.016667;
    [self.demoObject update:delta];
    
    [self.canvas setRenderingDelta: delta];
    [self.canvas setNeedsDisplay];
    
    self.lastDraw = self.displayLink.timestamp;
}

@end
