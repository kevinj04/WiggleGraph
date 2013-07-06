//
//  WGCurvyLine.h
//  WiggleGraph
//
//  Created by Kevin Jenkins on 7/5/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WGCurvyPoint.h"

@interface WGCurvyLine : NSObject

@property (strong, nonatomic) WGCurvyPoint *point1;
@property (strong, nonatomic) WGCurvyPoint *point2;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat graphHeight;

+ (id)lineWithInitialCGPoint:(CGPoint)start andEndCGPoint:(CGPoint)end;
- (id)initWithInitialCGPoint:(CGPoint)start andEndCGPoint:(CGPoint)end;
- (id)initWithInitialPoint:(WGCurvyPoint *)start andEndPoint:(WGCurvyPoint *)end;

- (void)update;
- (void)drawInContext:(CGContextRef)context;
- (void)drawControlPointsInContext:(CGContextRef)context;

@end
