//
//  AldObject.m
//  leowic-3_Labb1b
//
//  Created by Leonard Wickmark on 9/9/13.
//  Copyright (c) 2013 LTU. All rights reserved.
//

#import "AldObject.h"

@implementation AldObject
- (void)renderWithContext:(CGContextRef)ctx deltaT:(CGFloat)dt {
    [NSException raise:@"Invoked abstract rendering method." format:@"Invoked abstract rendering method."];
}
@end
