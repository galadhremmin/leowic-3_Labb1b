//
//  AldMovingObject.m
//  leowic-3_Labb1b
//
//  Created by Leonard Wickmark on 9/7/13.
//  Copyright (c) 2013 LTU. All rights reserved.
//

#import "AldMovingObject.h"
#import <math.h>

@implementation AldMovingObject

-(id)initWithBounds:(CGRect)bounds andPosition:(CGPoint)position andSize:(CGSize)size andTexture:(CGImageRef)texture {
    self = [super initWithPosition:position andSize:size andTexture:texture];
    if (self) {
        self.bounds = bounds;
    }
    
    return self;
}

-(BOOL)hitLeft {
    CGFloat x = self.position.x;
    return [self hitLeft: &x];
}

-(BOOL)hitRight {
    CGFloat x = self.position.x;
    return [self hitRight: &x];
}

-(BOOL)hitTop {
    CGFloat y = self.position.y;
    return [self hitTop: &y];
}

-(BOOL)hitBottom {
    CGFloat y = self.position.y;
    return [self hitBottom: &y];
}

-(BOOL)hitLeft:(CGFloat*)x {
    int leftBoundary = self.bounds.origin.x;
    CGFloat mod = -self.size.width/2;
    BOOL hit = *x + mod <= leftBoundary;
    
    if (hit) {
        *x = leftBoundary + -mod;
    }
    
    return hit;
}

-(BOOL)hitRight:(CGFloat*)x {
    int rightBoundary = self.bounds.origin.x + self.bounds.size.width;
    CGFloat mod = self.size.width/2;
    BOOL hit = *x + mod >= rightBoundary;
    
    if (hit) {
        *x = rightBoundary + -mod;
    }
    
    return hit;
}

-(BOOL)hitTop:(CGFloat*)y {
    int topBoundary = self.bounds.origin.y;
    CGFloat mod = -self.size.height/2;
    BOOL hit = *y + mod <= topBoundary;
    
    if (hit) {
        *y = topBoundary + -mod;
    }
    
    return hit;
}

-(BOOL)hitBottom:(CGFloat*)y {
    int bottomBoundary = self.bounds.origin.y + self.bounds.size.height;
    CGFloat mod = self.size.height/2;
    BOOL hit = *y + mod >= bottomBoundary;
    
    if (hit) {
        *y = bottomBoundary + -mod;
    }
    
    return hit;
}

-(void)setDirectionDeg:(CGFloat)dirDeg {
    [self setDirectionRad:dirDeg*M_PI/180.0f];
}

-(void)update:(CGFloat)dt {
    
    static const CGFloat deg180Rad = M_PI;
    
    CGFloat x = self.position.x, y = self.position.y, dir = self.directionRad;
    
    x += self.velocity * cosf(dir) * dt;
    y += self.velocity * sinf(dir) * dt;
    
    if ([self hitLeft: &x]) {
        dir = deg180Rad - dir;
    }
    
    if ([self hitRight: &x]) {
        dir = deg180Rad - dir;
    }
    
    if ([self hitTop: &y]) {
        dir = -dir;
    }
    
    if ([self hitBottom: &y]) {
        dir = -dir;
    }
    
    // Make sure that rotation is always within 0 < rot < 360 degrees
    while (dir >= deg180Rad*2) {
        dir -= deg180Rad*2;
    }
    
    self.position = CGPointMake(x, y);
    self.directionRad = dir;
    
}

@end
