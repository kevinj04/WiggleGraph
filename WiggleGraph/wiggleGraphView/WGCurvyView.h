//
//  WGCurvyView.h
//  WiggleGraph
//
//  Created by Kevin Jenkins on 7/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "WGView.h"
#import "WGCurvyPoint.h"

@interface WGCurvyView : WGView

@property (strong, nonatomic) NSArray *lineSegments;
@property (copy, nonatomic) CGFloat (^varianceMethod) (WGCurvyPoint *);

@end
