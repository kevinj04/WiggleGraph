//
//  WGViewController.m
//  WiggleGraph
//
//  Created by Kevin Jenkins on 7/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "WGViewController.h"

@interface WGViewController ()
@end

@implementation WGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.curvyView.wiggleSize = 2;
    self.curvyView.plotSize = 20;
    [self.curvyView setVarianceMethod:^CGFloat(WGCurvyPoint *point) {
        CGFloat uncertainty = point.dataPointIndex / 15.0;
        CGFloat intensity = point.y;
        if (intensity < 0.01) { intensity = 0.0; }
        CGFloat maxWiggle = MIN(5.0*uncertainty, intensity);
        return maxWiggle;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
