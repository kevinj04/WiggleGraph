//
//  WGScaleView.m
//  WiggleGraph
//
//  Created by Kevin Jenkins on 8/10/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "WGScaleView.h"

@implementation WGScaleView

#pragma mark - Initialization
- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.max = 100.0;
        self.min = 0.0;
        self.unit = @"%";
        self.title = @"Unknown";
        [self createLabels];
        [self layoutLabels];
        [self updateScales];
    }
    return self;
}

- (void)createLabels {

    self.maxLabel = [[UILabel alloc] init];
    self.midLabel = [[UILabel alloc] init];
    self.minLabel = [[UILabel alloc] init];
    self.titleLabel = [[UILabel alloc] init];

    self.titleLabel.textAlignment = NSTextAlignmentRight;

    [self addSubview:self.maxLabel];
    [self addSubview:self.midLabel];
    [self addSubview:self.minLabel];
    [self addSubview:self.titleLabel];
}

- (void)layoutLabels {    

    self.maxLabel.frame = CGRectMake(0, 0, 50, 15);
    self.midLabel.frame = CGRectMake(0, (self.frame.size.height/2.0)-7.5, 50, 15);
    self.minLabel.frame = CGRectMake(0, self.frame.size.height-15, 50, 15);
    self.titleLabel.frame = CGRectMake(self.frame.size.width-150, 0, 150, 15);

    self.maxLabel.font = [UIFont systemFontOfSize:8];
    self.midLabel.font = [UIFont systemFontOfSize:8];
    self.minLabel.font = [UIFont systemFontOfSize:8];
    self.titleLabel.font = [UIFont systemFontOfSize:8];

}

- (void)updateScales {

    self.maxLabel.text = [NSString stringWithFormat:@"%2.2f%@", self.max, self.unit];
    self.midLabel.text = [NSString stringWithFormat:@"%2.2f%@", self.min + (self.max - self.min)/2.0, self.unit];
    self.minLabel.text = [NSString stringWithFormat:@"%2.2f%@", self.min, self.unit];

    self.titleLabel.text = self.title;
}

#pragma mark - Setters
- (void)setTitle:(NSString *)title {
    _title = title;
    [self updateScales];
}
- (void)setUnit:(NSString *)unit {
    _unit = unit;
    [self updateScales];
}
- (void)setMax:(CGFloat)max {
    _max = max;
    [self updateScales];
}
- (void)setMin:(CGFloat)min {
    _min = min;
    [self updateScales];
}
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self layoutLabels];
}

@end
