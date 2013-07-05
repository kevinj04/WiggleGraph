//
//  WGPlotPoint.m
//  WiggleGraph
//
//  Created by Kevin Jenkins on 7/5/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "WGPlotPoint.h"

@implementation WGPlotPoint

- (id)init {
    self = [super init];
    if (self) {
        self.graphLocation = CGPointZero;
    }
    return self;
}

- (id)initDataPoint:(NSInteger)dataPointNumber withValue:(NSNumber *)value {

    self = [self init];
    if (self) {
        self.graphLocation = CGPointMake(dataPointNumber, value.floatValue);
    }
    return self;
}

- (void)update {
    // this is overridden in subclasses for added funtimes.
}

@end
