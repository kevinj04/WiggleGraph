//
//  WGCurvyLine.h
//  WiggleGraph
//
//  Created by Kevin Jenkins on 7/5/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WGPlotPoint.h"

@interface WGCurvyLine : NSObject

@property (strong, nonatomic) WGPlotPoint *point1;
@property (strong, nonatomic) WGPlotPoint *point2;

+ (id)lineWithInitialCGPoint:(CGPoint)start andEndCGPoint:(CGPoint)end;
- (id)initWithInitialCGPoint:(CGPoint)start andEndCGPoint:(CGPoint)end;
- (id)initWithInitialPoint:(WGPlotPoint *)start andEndPoint:(WGPlotPoint *)end;

@end
