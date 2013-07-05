//
//  WGView.h
//  WiggleGraph
//
//  Created by Kevin Jenkins on 7/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WGView : UIView

@property (strong, nonatomic) NSArray *plotValues;
@property (assign, nonatomic) NSInteger plotSize;
@property (assign, nonatomic) CGFloat wiggleSize;

@property (strong, nonatomic) CADisplayLink *displayLink;

- (void)update;

- (NSArray *)generatePlotValues;

- (CGFloat)plotWidth;
- (CGFloat)valueAtIndex:(NSInteger)index;

@end
