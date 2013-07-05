//
//  WGCurvyPoint.m
//  WiggleGraph
//
//  Created by Kevin Jenkins on 7/5/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "WGCurvyPoint.h"

@implementation WGCurvyPoint

- (id)init {
    self = [super init];
    if (self) {
        self.phase = 0;
        self.variance = 0;
        self.speed = 0.1;
        direction = 1.0;
    }
    return self;
}

- (void)randomizePhase {
    self.phase = (100 - arc4random_uniform(200))/100.0;
}

- (void)randomizeVariance {
    self.variance = (100 - arc4random_uniform(200))/100.0;
}

#pragma mark - Update
- (void)update {
    [self updateDirection];
    [self updatePhase];
    // maybe update position here too
}

- (void)updateDirection {
    if (self.phase > 1.0) {
        direction = -1.0;
    } else if (self.phase < -1.0) {
        direction = 1.0;
    }
}

- (void)updatePhase {
    self.phase += direction * self.speed;
}

@end
