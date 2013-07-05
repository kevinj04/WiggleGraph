//
//  WGCurvyPoint.m
//  WiggleGraph
//
//  Created by Kevin Jenkins on 7/5/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "WGCurvyPoint.h"

@implementation WGCurvyPoint

#pragma mark - Initialization
- (id)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initDataPoint:(NSInteger)dataPointNumber withValue:(NSNumber *)value {

    self = [super initDataPoint:dataPointNumber withValue:value];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.phase = 0;
    self.variance = 0;
    self.speed = 0.02;
    self.maxPhase = 1.0;
    self.minPhase = -1.0;
    direction = 1.0;
}

+ (id)dataPoint:(NSInteger)dataPointNumber withValue:(NSNumber *)value {
    return [[WGCurvyPoint alloc] initDataPoint:dataPointNumber withValue:value];
}

- (void)randomizePhase {
    CGFloat randomValue = (100.0 - arc4random_uniform(200.0))/100.0;
    if (randomValue > 0) { self.phase = randomValue * self.maxPhase; }
    else { self.phase = randomValue * self.minPhase; }
}

- (void)randomizeVariance {
    self.variance = (100.0 - arc4random_uniform(200.0))/10.0;
}

#pragma mark - Update
- (void)update {
    [self updateDirection];
    [self updatePhase];
    // maybe update position here too
}

- (void)updateDirection {
    if (self.phase > self.maxPhase) {
        direction = -1.0;
    } else if (self.phase < self.minPhase) {
        direction = 1.0;
    }
}

- (void)updatePhase {
    self.phase += direction * self.speed;
}

#pragma mark - Access Methods
- (CGFloat)wiggle {
    return self.phase * self.variance;
}

#pragma mark - Pretty Print
- (NSString *)description {
    return [NSString stringWithFormat:@"CurvyPoint<%p> x:%0.1f y:%0.1f phase:%0.1f variance:%0.1f wiggle:%0.1f", self, self.x, self.y, self.phase, self.variance, [self wiggle]];
}

@end
