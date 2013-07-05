//
//  WGCurvyView.m
//  WiggleGraph
//
//  Created by Kevin Jenkins on 7/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "WGCurvyView.h"
#import "WGCurvyLine.h"

static CGFloat curvePhase = -1.0;
static CGFloat curvePhaseDirection = 1.0;
static CGFloat curvePhaseSpeed = .01;

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
    for (int i=0; i<self.plotSize-1; i++) {
        CGPoint start = CGPointMake(i, [self.plotValues[i] floatValue]);
        CGPoint end = CGPointMake(i+1, [self.plotValues[i+1] floatValue ]);
        WGCurvyLine *line = [WGCurvyLine lineWithInitialCGPoint:start andEndCGPoint:end];
        [lines addObject:line];
    }
    return lines;
}

#pragma mark - Update
- (void)update {
    [self updateCurvePhase];
    [super update];
}

- (CGFloat)curveWiggle {
    [self updateCurvePhase];
    return curvePhase * (self.wiggleSize - arc4random_uniform(roundf(self.wiggleSize/2.0)));
}

- (void)updateCurvePhase {
    if (curvePhase > 1.0) { curvePhaseDirection = -1.0; }
    else if (curvePhase < -1.0) { curvePhaseDirection = 1.0; }
    curvePhase = curvePhase + curvePhaseSpeed * curvePhaseDirection;
}

- (CGFloat)plotWidth {
    return self.frame.size.width / (self.plotSize - 1);
}


// make classes for plot points, have them each on their own phase
- (void)plotWithContext:(CGContextRef)context {
    CGFloat plotWidth = [self plotWidth];

    CGContextMoveToPoint(context, 0, self.frame.size.height);
    CGContextAddLineToPoint(context, 0, [self valueAtIndex:0]);

    for (int i=0; i<self.plotValues.count-1; i++) {
        CGFloat x = i * plotWidth;
        CGFloat y = self.frame.size.height - [self valueAtIndex:i];
        CGFloat x2 = x + plotWidth;
        CGFloat y2 = self.frame.size.height - [self valueAtIndex:i+1];
        CGFloat halfPlotWidth = plotWidth *.5;
        CGContextAddCurveToPoint(context, x+halfPlotWidth, y+self.curveWiggle, x2-halfPlotWidth, y2-self.curveWiggle, x2, y2);
    }
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height);
    CGContextClosePath(context);

    CGContextSetLineWidth(context, 1.0);
    CGContextSetRGBFillColor(context, 0.07, 0.78, 0.12, 1.0);
    CGContextFillPath(context);
}

@end
