//
//  WGBoxyView.m
//  WiggleGraph
//
//  Created by Kevin Jenkins on 7/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "WGBoxyView.h"

@implementation WGBoxyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)update {
    self.plotValues = [self generatePlotValues];
    [super update];
}

- (void)plotWithContext:(CGContextRef)context {
    CGFloat plotWidth = [self plotWidth];
    for (int i=0; i<self.plotValues.count; i++) {
        CGContextMoveToPoint(context, i * plotWidth, self.frame.size.height);
        CGContextAddLineToPoint(context, i * plotWidth, self.frame.size.height-[self valueAtIndex:i]);
    }
    CGContextSetLineWidth(context, 1.0*plotWidth);
}

@end
