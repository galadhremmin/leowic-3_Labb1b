//
//  AldObject.h
//  leowic-3_Labb1b
//
//  Created by Leonard Wickmark on 9/9/13.
//  Copyright (c) 2013 LTU. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AldIRenderableObject 
- (void)renderWithContext:(CGContextRef)ctx deltaT:(CGFloat)dt;
@end
