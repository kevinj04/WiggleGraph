//
//  WGView.m
//  WiggleGraph
//
//  Created by Kevin Jenkins on 7/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "WGView.h"

@implementation WGView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {

    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {

    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];

    self.plotSize = 10;
    self.wiggleSize = 50;
    self.plotValues = [self generatePlotValues];
}

- (NSArray *)generatePlotValues {

    CGFloat midRange = self.frame.size.height / 2.0;
    CGFloat lastValue = -1;
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:self.plotSize];
    for (int i=0; i<self.plotSize; i++) {
        if (lastValue < 0) {
            lastValue = midRange;
        }
        [tempArray addObject:[self randomValueWithBase:lastValue]];
    }
    return tempArray;
}

- (void)setPlotSize:(NSInteger)plotSize {
    _plotSize = plotSize;
    self.plotValues = [self generatePlotValues];
}

- (NSNumber *)randomValueWithBase:(CGFloat)base {
    return [NSNumber numberWithFloat:base + [self variance]];
}

- (CGFloat)variance {
    CGFloat maxVariance = self.frame.size.height/5.0;
    return (-maxVariance*5 + arc4random_uniform(maxVariance*10))/10.0;
    //return (-self.wiggleSize*5 + arc4random_uniform(self.wiggleSize*10))/10.0;
}

- (CGPoint)range {

    CGPoint range = CGPointZero;

    for (NSNumber *number in self.plotValues) {
        if (number.floatValue < range.x) {
            range.x = number.floatValue;
        } else if (number.floatValue > range.y) {
            range.y = number.floatValue;
        }
    }
    return range;
}

- (CGFloat)valueAtIndex:(NSInteger)index {
    return [[self.plotValues objectAtIndex:index] floatValue];
}

- (void)update {
    [self setNeedsDisplay];
}

- (CGFloat)plotWidth {
    return self.frame.size.width / self.plotSize;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    [self plotWithContext:context];

    CGContextSetRGBStrokeColor(context, 0.07, 0.78, 0.12, 1.0);
    CGContextStrokePath(context);
}

- (void)plotWithContext:(CGContextRef)context {
    // override me
}

@end
