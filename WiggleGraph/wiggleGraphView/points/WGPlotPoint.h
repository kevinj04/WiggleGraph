//
//  WGPlotPoint.h
//  WiggleGraph
//
//  Created by Kevin Jenkins on 7/5/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "WGView.h"

@interface WGPlotPoint : NSObject

@property (assign, nonatomic) CGPoint graphLocation;

- (void)update;

@end
