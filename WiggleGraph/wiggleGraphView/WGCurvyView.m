//
//  WGCurvyView.m
//  WiggleGraph
//
//  Created by Kevin Jenkins on 7/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "WGCurvyView.h"
#import "WGCurvyLine.h"

@implementation WGCurvyView

#pragma mark - Initialization
- (id)init {

    self = [super init];
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setup {
    [super setup];
    self.lineSegments = [self generateLines];
}

- (NSArray *)generateLines {

    NSMutableArray *lines = [NSMutableArray arrayWithCapacity:self.plotSize-1];
    WGCurvyLine *lastLine = nil;
    for (int i=0; i<self.plotSize-1; i++) {
        CGPoint start = CGPointMake(i, self.frame.size.height - [self.plotValues[i] floatValue]);
        CGPoint end = CGPointMake(i+1, self.frame.size.height - [self.plotValues[i+1] floatValue]);
        WGCurvyLine *line = [WGCurvyLine lineWithInitialCGPoint:start andEndCGPoint:end];

        if (lastLine) {
            line.point1 = lastLine.point2;
        } else {
            line.point1.variance = 20;
            [line.point1 randomizePhase];
        }

        line.point2.variance = 20;
        [line.point2 randomizePhase];

        line.width = [self segmentWidth];

        [lines addObject:line];
        lastLine = line;
    }
    return lines;
}

#pragma mark - Update
- (void)update {
    [self updateLineSegments];
    [super update];
}

- (void)updateLineSegments {

    [self.lineSegments enumerateObjectsUsingBlock:^(WGCurvyLine *line, NSUInteger idx, BOOL *stop) {
        [line update];
    }];
}

- (CGFloat)segmentWidth {
    return self.frame.size.width / (self.plotSize - 1);
}


// make classes for plot points, have them each on their own phase
- (void)plotWithContext:(CGContextRef)context {

    CGContextMoveToPoint(context, 0, self.frame.size.height);
    CGContextAddLineToPoint(context, 0, [self valueAtIndex:0]);

    for (WGCurvyLine *line in self.lineSegments) {
        [line drawInContext:context];
    }

    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height);
    CGContextClosePath(context);

    CGContextSetLineWidth(context, 1.0);
    CGContextSetRGBFillColor(context, 0.07, 0.78, 0.12, 1.0);
    CGContextFillPath(context);

    // for debugging
    for (WGCurvyLine *line in self.lineSegments) {
        [line drawControlPointsInContext:context];
    }
}

@end
