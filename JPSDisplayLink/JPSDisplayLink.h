//
//  JPSDisplayLink.h
//  JPSDisplayLink
//
//  Created by JP Simard on 1/12/2014.
//  Copyright (c) 2014 JP Simard. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^JPSDisplayLinkBlock)(CGFloat progress);

@interface JPSDisplayLink : NSObject

/**
 Deprecated to fall in line with Apple's suggested best practices for method declarations with blocks
 https://developer.apple.com/library/ios/documentation/cocoa/conceptual/ProgrammingWithObjectiveC/WorkingwithBlocks/WorkingwithBlocks.html
*/

+ (void)runDisplayLinkBlock:(JPSDisplayLinkBlock)block duration:(CFTimeInterval)duration __attribute__((deprecated));


/**
 This block is called multiple times.
 The CGFloat progress is between 0.0 and 1.0 based on the percentage
 of the total duration that has elapsed since the begininning of execution.
*/

+ (void)runDisplayLinkWithDuration:(CFTimeInterval)duration block:(JPSDisplayLinkBlock)block;

@end
