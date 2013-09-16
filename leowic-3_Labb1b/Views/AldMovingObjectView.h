//
//  AldMovingObjectView.h
//  leowic-3_Labb1b
//
//  Created by Leonard Wickmark on 9/8/13.
//  Copyright (c) 2013 LTU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AldMovingObjectView : UIView

@property (strong, nonatomic) NSMutableArray *sprites;
@property (nonatomic) CGFloat renderingDelta;

@end
