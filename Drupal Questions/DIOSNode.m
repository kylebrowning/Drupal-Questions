//
//  DIOSSession.m
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import "DIOSNode.h"

@implementation DIOSNode

@synthesize delegate = _delegate;
- (id) init {
  self = [super init];
  if (!self) {
    return nil;
  }
  [self setDelegate:self];
  return self;
}
- (id) initWithDelegate:(id<DIOSNodeDelegate>)aDelegate {
  self = [super init];
  if (!self) {
    return nil;
  }
  [self setDelegate:aDelegate];
  return self;
}

#pragma mark nodeGets
- (void)nodeGet:(NSDictionary *)node {
  [[DIOSSession sharedSession] getPath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosBaseNode, [node objectForKey:@"nid"]] parameters:nil success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(nodeGetDidFinish:operation:response:error:)]) {
      [_delegate nodeGetDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate for this get so my response will never be used.");
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(nodeGetDidFinish:operation:response:error:)]) {
      [_delegate nodeGetDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate for this get so my response will never be used.");
    }
  }];
}
- (void)nodeGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}

#pragma mark nodePosts
- (void)nodePost:(NSDictionary *)node {
  [[DIOSSession sharedSession] postPath:[NSString stringWithFormat:@"%@/%@", kDiosEndpoint, kDiosBaseNode] parameters:node success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(nodePostDidFinish:operation:response:error:)]) {
      [_delegate nodePostDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate for this post so my response will never be used.");
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(nodePostDidFinish:operation:response:error:)]) {
      [_delegate nodePostDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate for this post so my response will never be used.");
    }
  }];
}
- (void)nodePostDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}

#pragma mark nodePut
- (void)nodePut:(NSDictionary *)node {
  [[DIOSSession sharedSession] putPath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosBaseNode, [node objectForKey:@"cid"]] parameters:node success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(nodePutDidFinish:operation:response:error:)]) {
      [_delegate nodePutDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate for this put so my response will never be used.");
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(nodePutDidFinish:operation:response:error:)]) {
      [_delegate nodePutDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate for this put so my response will never be used.");
    }
  }];
}
- (void)nodePutDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}

#pragma mark nodeDelete
- (void)nodeDelete:(NSDictionary *)node {
  [[DIOSSession sharedSession] deletePath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosBaseNode, [node objectForKey:@"cid"]] parameters:node success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(nodeDeleteDidFinish:operation:response:error:)]) {
      [_delegate nodeDeleteDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate for this delete so my response will never be used.");
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(nodeDeleteDidFinish:operation:response:error:)]) {
      [_delegate nodeDeleteDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate for this delete so my response will never be used.");
    }
  }];
}
- (void)nodeDeleteDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
@end
