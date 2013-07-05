//
//  WGCurvyPoint.h
//  WiggleGraph
//
//  Created by Kevin Jenkins on 7/5/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "WGPlotPoint.h"

@interface WGCurvyPoint : WGPlotPoint {

    CGFloat direction;
}

@property (assign, nonatomic) CGFloat phase;
@property (assign, nonatomic) CGFloat variance;
@property (assign, nonatomic) CGFloat speed;
@property (assign, nonatomic) CGFloat maxPhase;
@property (assign, nonatomic) CGFloat minPhase;

- (CGFloat)wiggle;
- (void)randomizePhase;

@end
