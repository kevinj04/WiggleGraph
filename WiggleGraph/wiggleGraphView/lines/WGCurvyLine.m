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
        self.width = 0;
    }
    return self;
}

- (id)initWithInitialCGPoint:(CGPoint)start andEndCGPoint:(CGPoint)end {

    self = [self init];
    if (self) {
        self.point1 = [WGCurvyPoint dataPoint:start.x withValue:[NSNumber numberWithFloat:start.y]];
        self.point2 = [WGCurvyPoint dataPoint:end.x withValue:[NSNumber numberWithFloat:end.y]];
        self.width = self.point1.dataPointIndex - self.point2.dataPointIndex;
    }
    return self;
}

- (id)initWithInitialPoint:(WGCurvyPoint *)start andEndPoint:(WGCurvyPoint *)end {

    self = [self init];
    if (self) {
        self.point1 = start;
        self.point2 = end;
    }
    return self;
}

+ (id)lineWithInitialCGPoint:(CGPoint)start andEndCGPoint:(CGPoint)end {
    return [[WGCurvyLine alloc] initWithInitialCGPoint:start andEndCGPoint:end];
}

#pragma mark - Update
- (void)update {
    [self.point1 update];
    [self.point2 update];
}

#pragma mark - Drawing
- (CGFloat)x1 {
    return self.point1.x * self.width + self.width/2.0;
}
- (CGFloat)y1 {
    return self.point1.y + self.point1.wiggle;
}
- (CGFloat)x2 {
    return self.point2.x * self.width - self.width/2.0;
}
- (CGFloat)y2 {
    return self.point2.y +self.point2.wiggle;
}
- (CGFloat)x3 {
    return self.point2.x * self.width;
}
- (CGFloat)y3 {
    return self.point2.y;
}
- (void)drawInContext:(CGContextRef)context {
    CGContextAddCurveToPoint(context, self.x1, self.y1, self.x2, self.y2, self.x3, self.y3);
}

@end
