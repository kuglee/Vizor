//
//  loader.m
//  Vizor
//
//  Created by Gábor Librecz on 2018. 10. 26..
//  Copyright © 2018. Gábor Librecz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vizor-Swift.h"

@interface Loader : NSObject
@end

// The initialization of the plugin if done in Objective-C because using
// the initialize method is not allowed in Swift.
@implementation Loader

+ (void)load {
  [SIMBLPlugin initializePlugin];
}

@end
