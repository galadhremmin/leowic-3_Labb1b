//
//  AldStaticObject.h
//  leowic-3_Labb1b
//
//  Created by Leonard Wickmark on 9/9/13.
//  Copyright (c) 2013 LTU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AldObject.h"

@interface AldStaticObject : AldObject

@property (nonatomic) CGPoint position;
@property (nonatomic) CGSize size;
@property (nonatomic) CGImageRef texture;

- (id)init;
- (id)initWithPosition:(CGPoint)position andSize:(CGSize)size;
- (id)initWithPosition:(CGPoint)position andSize:(CGSize)size andTexture:(CGImageRef)image;
- (void)renderWithContext:(CGContextRef)ctx deltaT:(CGFloat)dt;

@end
