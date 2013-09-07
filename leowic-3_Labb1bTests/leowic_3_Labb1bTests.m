//
//  leowic_3_Labb1bTests.m
//  leowic-3_Labb1bTests
//
//  Created by Leonard Wickmark on 9/7/13.
//  Copyright (c) 2013 LTU. All rights reserved.
//

#import "leowic_3_Labb1bTests.h"
#import "AldMovingObject.h"

@implementation leowic_3_Labb1bTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    // Tear-down code here.
    [super tearDown];
}

- (void)testMovingObjectLeftBoundaryCheck
{
    AldMovingObject *obj = [[AldMovingObject alloc] initWithBounds:CGRectMake(100, 100, 1000, 1000) andPosition:CGPointMake(100, 100)];
    CGFloat x = 50;
    
    BOOL hits = [obj hitLeft: &x];
    
    STAssertEquals(hits, YES, @"The object's position is outside the moving object's left boundary, but the hitLeft method believes it is not.");
    STAssertEquals(x, 100.0f, @"x should be set to boundary value.");
    
    x = 101;
    hits = [obj hitLeft: &x];
    
    STAssertEquals(hits, NO, @"The object's position is inside the moving object's left boundary, but the hitLeft method believes it is not.");
    STAssertEquals(x, 101.0f, @"x should be unchanged, but it isn't.");
}

- (void)testMovingObjectRightBoundaryCheck
{
    AldMovingObject *obj = [[AldMovingObject alloc] initWithBounds:CGRectMake(100, 100, 1000, 1000) andPosition:CGPointMake(100, 100)];
    CGFloat x = 1101;
    
    BOOL hits = [obj hitRight: &x];

    STAssertEquals(hits, YES, @"The object's position is outside the moving object's right boundary, but the hitRight method believes it is not.");
    STAssertEquals(x, 1100.0f, @"x should be set to boundary value.");
    
    x = 500;
    hits = [obj hitRight: &x];
    
    STAssertEquals(hits, NO, @"The object's position is inside the moving object's right boundary, but the hitRight method believes it is not.");
    STAssertEquals(x, 500.0f, @"x should be unchanged, but it isn't.");
}

- (void)testMovingObjectTopBoundaryCheck
{
    AldMovingObject *obj = [[AldMovingObject alloc] initWithBounds:CGRectMake(100, 100, 1000, 1000) andPosition:CGPointMake(100, 50)];
    
    BOOL hits = [obj hitTop];
    
    STAssertEquals(hits, YES, @"The object's position is outside the moving object's top boundary, but the hitTop method believes it is not.");
    
    [obj setPosition:CGPointMake(100, 500)];
    hits = [obj hitTop];
    
    STAssertEquals(hits, NO, @"The object's position is inside the moving object's top boundary, but the hitTop method believes it is not.");
}

- (void)testMovingObjectBottomBoundaryCheck
{
    AldMovingObject *obj = [[AldMovingObject alloc] initWithBounds:CGRectMake(100, 100, 1000, 1000) andPosition:CGPointMake(100, 1150)];
    BOOL hits = [obj hitBottom];
    
    STAssertEquals(hits, YES, @"The object's position is outside the moving object's bottom boundary, but the hitBottom method believes it is not.");
    
    [obj setPosition:CGPointMake(100, 1000)];
    hits = [obj hitBottom];
    
    STAssertEquals(hits, NO, @"The object's position is inside the moving object's bottom boundary, but the hitBottom method believes it is not.");
}

@end
