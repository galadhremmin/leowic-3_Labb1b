//
//  AldStaticObject.m
//  leowic-3_Labb1b
//
//  Created by Leonard Wickmark on 9/9/13.
//  Copyright (c) 2013 LTU. All rights reserved.
//

#import "AldStaticObject.h"

@implementation AldStaticObject

- (id)init
{
    return [self initWithPosition:CGPointMake(0, 0) andSize:CGSizeMake(1, 1)];
}

- (id)initWithPosition:(CGPoint)position andSize:(CGSize)size
{
    return [self initWithPosition:position andSize:size andTexture:nil];
}

- (id)initWithPosition:(CGPoint)position andSize:(CGSize)size andTexture:(CGImageRef)image;
{
    self = [super init];
    if (self) {
        self.position = position;
        self.size = size;
        self.texture = image;
    }
    return self;
}

- (void)renderWithContext:(CGContextRef)ctx deltaT:(CGFloat)dt {
    
    CGRect rect = CGRectMake(self.position.x - self.size.width * 0.5,
                             self.position.y - self.size.height * 0.5,
                             self.size.width,
                             self.size.height);
    
    CGContextSetRGBFillColor(ctx, 1, 0, 1, 1);
    CGContextFillEllipseInRect(ctx, rect);
}

@end
