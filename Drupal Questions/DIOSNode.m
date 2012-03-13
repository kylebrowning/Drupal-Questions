//
//  DIOSSession.m
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import "DIOSNode.h"

@implementation DIOSNode

- (void)getNode:(NSString *)nid withDelegate:(id)delegate {
  DIOSSession *session = [DIOSSession sharedSession];
  [session setDelegate:delegate];
  [session getPath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosNodeGet, nid] parameters:nil success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([[session delegate] respondsToSelector:@selector(success:response:)]) {
      [[session delegate] success:operation response:JSON];
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([[session delegate] respondsToSelector:@selector(failure:error:)]) {
      [[session delegate] failure:operation error:error];
    }
  }];
}

@end
