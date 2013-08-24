//
//  WGScaleView.h
//  WiggleGraph
//
//  Created by Kevin Jenkins on 8/10/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WGScaleView : UIView

@property (assign, nonatomic) CGFloat max;
@property (assign, nonatomic) CGFloat min;
@property (strong, nonatomic) NSString *unit;
@property (strong, nonatomic) NSString *title;

@property (strong, nonatomic) UILabel *maxLabel;
@property (strong, nonatomic) UILabel *midLabel;
@property (strong, nonatomic) UILabel *minLabel;
@property (strong, nonatomic) UILabel *titleLabel;

@end
