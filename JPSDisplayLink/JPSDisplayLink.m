//
//  JPSDisplayLink.m
//  JPSDisplayLink
//
//  Created by JP Simard on 1/12/2014.
//  Copyright (c) 2014 JP Simard. All rights reserved.
//

#import "JPSDisplayLink.h"

@interface JPSDisplayLink ()

@property (nonatomic, copy) JPSDisplayLinkBlock block;
@property (nonatomic, strong) CADisplayLink *caDisplayLink;
@property (nonatomic, assign) CFTimeInterval duration;
@property (nonatomic, assign) CFTimeInterval startTime;

@end

@implementation JPSDisplayLink

+ (void)runDisplayLinkBlock:(JPSDisplayLinkBlock)block duration:(CFTimeInterval)duration
{
    [self runDisplayLinkWithDuration:duration block:block];
}

+ (void)runDisplayLinkWithDuration:(CFTimeInterval)duration block:(JPSDisplayLinkBlock)block {
    JPSDisplayLink *displayLink = [[JPSDisplayLink alloc] init];
    displayLink.block = block;
    displayLink.duration = duration;
    
    displayLink.caDisplayLink = [CADisplayLink displayLinkWithTarget:displayLink selector:@selector(runBlock)];
    [displayLink.caDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)runBlock {
    if (self.startTime == 0) self.startTime = self.caDisplayLink.timestamp;
    
    CFTimeInterval elapsed = self.caDisplayLink.timestamp - self.startTime;
    
    if (elapsed > self.duration) {
        [self.caDisplayLink invalidate];
    } else {
        self.block(elapsed / self.duration);
    }
}

@end
