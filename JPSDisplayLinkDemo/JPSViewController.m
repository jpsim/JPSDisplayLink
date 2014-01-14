//
//  JPSViewController.m
//  JPSDisplayLinkDemo
//
//  Created by JP Simard on 1/13/2014.
//  Copyright (c) 2014 JP Simard. All rights reserved.
//

#import "JPSViewController.h"
#import "JPSDisplayLink.h"

@implementation JPSViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupLabel];
}

- (void)setupLabel {
    // Label
    UILabel *label = [[UILabel alloc] init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.text = @"JPSDisplayLink Demo";
    [self.view addSubview:label];
    
    // Constraints
    centerViewInView(label, self.view);
    
    // Display Link Animation
    __weak UILabel *weakLabel = label;
    [JPSDisplayLink runDisplayLinkBlock:^(CGFloat progress) {
        weakLabel.font = [UIFont boldSystemFontOfSize:12.0f + progress*16.0f];
    } duration:5.0f];
}

#pragma mark - Autolayout

void centerViewInView(UIView *view1, UIView *view2) {
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f];
    [view2 addConstraints:@[centerX, centerY]];
}

@end
