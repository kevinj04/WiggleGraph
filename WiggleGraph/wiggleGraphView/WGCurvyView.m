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
        CGPoint start = CGPointMake(i, [self.plotValues[i] floatValue]);
        CGPoint end = CGPointMake(i+1, [self.plotValues[i+1] floatValue]);
        WGCurvyLine *line = [WGCurvyLine lineWithInitialCGPoint:start andEndCGPoint:end];
        line.graphHeight = self.frame.size.height;

        if (lastLine) {
            line.point1 = lastLine.point2;
        } else {
            line.point1.variance = [self calculateVarianceForDataPoint:line.point1];
            line.point2.maxPhase = arc4random_uniform(100.0)/100.0;
            line.point2.minPhase = -1.0 * arc4random_uniform(100.0)/100.0;
            [line.point1 randomizePhase];
        }

        line.point2.variance = [self calculateVarianceForDataPoint:line.point2];
        line.point2.maxPhase = arc4random_uniform(100.0)/100.0;
        line.point2.minPhase = -1.0 * arc4random_uniform(100.0)/100.0;
        [line.point2 randomizePhase];

        line.width = [self segmentWidth];

        [lines addObject:line];
        lastLine = line;
    }
    return lines;
}

#pragma mark - Setters/Getters
- (void)setPlotValues:(NSArray *)plotValues {
    [super setPlotValues:plotValues];
    self.lineSegments = [self generateLines];
}

- (void)setVarianceMethod:(CGFloat (^)(WGCurvyPoint *))varianceMethod {
    _varianceMethod = varianceMethod;
    self.lineSegments = [self generateLines];
}

#pragma mark - Update
- (void)update {
    [self updateLineSegments];
    [super update];
}

- (CGFloat)calculateVarianceForDataPoint:(WGCurvyPoint *)point {
    if (self.varianceMethod) {
        return self.varianceMethod(point);
    } else {
        return 20;
    }
}

- (void)updateLineSegments {

    [self.lineSegments enumerateObjectsUsingBlock:^(WGCurvyLine *line, NSUInteger idx, BOOL *stop) {
        [line update];
    }];
}

- (CGFloat)segmentWidth {
    return self.frame.size.width / (self.plotSize - 1);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self generateLines];
}

// make classes for plot points, have them each on their own phase
- (void)plotWithContext:(CGContextRef)context {

    CGContextMoveToPoint(context, 0, self.frame.size.height);
    CGContextAddLineToPoint(context, 0, self.frame.size.height - [self valueAtIndex:0]);

    for (WGCurvyLine *line in self.lineSegments) {
        [line drawInContext:context];
    }

    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height);
    CGContextClosePath(context);

    CGContextSetLineWidth(context, 1.0);
    CGContextSetFillColorWithColor(context, self.fillColor.CGColor);
    CGContextFillPath(context);

    // for debugging
    /*
    for (WGCurvyLine *line in self.lineSegments) {
        [line drawControlPointsInContext:context];
    }
     */
}

@end
