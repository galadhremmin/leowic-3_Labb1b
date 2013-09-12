//
//  AldMovingObject.h
//  leowic-3_Labb1b
//
//  Created by Leonard Wickmark on 9/7/13.
//  Copyright (c) 2013 LTU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AldStaticObject.h"

@interface AldMovingObject : AldStaticObject

@property (nonatomic) CGRect bounds;
@property (nonatomic) CGFloat velocity;
@property (nonatomic) CGFloat directionRad;
@property (nonatomic, copy) NSString *stringID;

/** Returns an initialized AldMovingObject object with the given position, as well as restricted movement within the given bounds.
 */
-(id)initWithBounds:(CGRect)bounds andPosition:(CGPoint)position andSize:(CGSize)size andTexture: (CGImageRef)texture;

-(BOOL)hitLeft;
-(BOOL)hitRight;
-(BOOL)hitTop;
-(BOOL)hitBottom;
-(BOOL)hitLeft:(CGFloat*)x;
-(BOOL)hitRight:(CGFloat*)x;
-(BOOL)hitTop:(CGFloat*)y;
-(BOOL)hitBottom:(CGFloat*)y;

-(void)update:(CGFloat)dt;

@end
