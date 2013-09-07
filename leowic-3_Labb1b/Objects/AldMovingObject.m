//
//  AldMovingObject.m
//  leowic-3_Labb1b
//
//  Created by Leonard Wickmark on 9/7/13.
//  Copyright (c) 2013 LTU. All rights reserved.
//

#import <math.h>
#import "AldMovingObject.h"

@implementation AldMovingObject

-(id)initWithBounds:(CGRect)bounds andPosition:(CGPoint)position {
    self = [super init];
    if (self) {
        self.bounds = bounds;
        self.position = position;
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
    BOOL hit = *x <= leftBoundary;
    
    if (hit) {
        *x = leftBoundary;
    }
    
    return hit;
}

-(BOOL)hitRight:(CGFloat*)x {
    int rightBoundary = self.bounds.origin.x + self.bounds.size.width;
    BOOL hit = *x >=  + rightBoundary;
    
    if (hit) {
        *x = rightBoundary;
    }
    
    return hit;
}

-(BOOL)hitTop:(CGFloat*)y {
    int topBoundary = self.bounds.origin.y;
    BOOL hit = *y <= topBoundary;
    
    if (hit) {
        *y = topBoundary;
    }
    
    return hit;
}

-(BOOL)hitBottom:(CGFloat*)y {
    int bottomBoundary = self.bounds.origin.y + self.bounds.size.height;
    BOOL hit = *y >= bottomBoundary;
    
    if (hit) {
        *y = bottomBoundary;
    }
    
    return *y >= bottomBoundary;
}

-(void)update:(CGFloat)dt {
    
    static const CGFloat deg90Rad = 90 * M_PI / 180.0;
    static const CGFloat deg360Rad = 360 * M_PI / 180.0;
    
    CGFloat x = self.position.x, y = self.position.y, dir = self.directionRad;
    
    x += self.velocity * cosf(dir) * dt;
    y += self.velocity * sinf(dir) * dt;
    
    if ([self hitLeft: &x]) {
        dir += deg90Rad;
    }
    
    if ([self hitRight: &x]) {
        dir += deg90Rad;
    }
    
    if ([self hitTop: &y]) {
        dir += deg90Rad;
    }
    
    if ([self hitBottom: &y]) {
        dir += deg90Rad;
    }
    
    // Make sure that rotation is always within 0 < rot < 360 degrees
    while (dir >= deg360Rad) {
        dir -= deg360Rad;
    }
    
    self.position = CGPointMake(x, y);
    self.directionRad = dir;
    
}

@end
