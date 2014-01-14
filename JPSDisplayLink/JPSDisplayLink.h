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

+ (void)runDisplayLinkBlock:(JPSDisplayLinkBlock)block duration:(CFTimeInterval)duration;

@end
