//
//  DIOSNode.h
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"
#import "DIOSSession.h"
@interface DIOSNode : NSObject
- (void)getNode:(NSString *)nid withDelegate:(id)delegate;
@end
