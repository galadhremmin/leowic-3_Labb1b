//
//  AldMovingObjectView.m
//  leowic-3_Labb1b
//
//  Created by Leonard Wickmark on 9/8/13.
//  Copyright (c) 2013 LTU. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "AldIRenderableObject.h"
#import "AldMovingObjectView.h"

@interface AldMovingObjectView()

@end

@implementation AldMovingObjectView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.sprites = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(ctx, 1, 1, 1, 1);
    CGContextFillRect(ctx, self.bounds);
    for (NSObject<AldIRenderableObject> *sprite in self.sprites) {
        [sprite renderWithContext:ctx deltaT:self.renderingDelta];
    }
}


@end
