//
//  WGCurvyLine.m
//  WiggleGraph
//
//  Created by Kevin Jenkins on 7/5/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "WGCurvyLine.h"

@implementation WGCurvyLine

#pragma mark - Initialization
- (id)init {

    self = [super init];
    if (self) {
        self.point1 = nil;
        self.point2 = nil;
    }
    return self;
}

- (id)initWithInitialCGPoint:(CGPoint)start andEndCGPoint:(CGPoint)end {

    self = [self init];
    if (self) {
        self.point1 = [WGPlotPoint dataPoint:start.x withValue:[NSNumber numberWithFloat:start.y]];
        self.point2 = [WGPlotPoint dataPoint:end.x withValue:[NSNumber numberWithFloat:end.y]];
    }
    return self;
}

- (id)initWithInitialPoint:(WGPlotPoint *)start andEndPoint:(WGPlotPoint *)end {

    self = [self init];
    if (self) {
        self.point1 = start;
        self.point2 = end;
    }
    return self;
}

#pragma mark - Update
- (void)update {
    [self.point1 update];
    [self.point2 update];
}

@end
