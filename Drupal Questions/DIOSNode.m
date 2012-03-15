//
//  DIOSNode.m
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
      DLog(@"I couldnt find the delegate and one was set %@ for this get so my response will never be used.", _delegate);
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(nodeGetDidFinish:operation:response:error:)]) {
      [_delegate nodeGetDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this get so my response will never be used.", _delegate);
    }
  }];
}
- (void)nodeGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}

#pragma mark nodeUpdates
- (void)nodeSave:(NSDictionary *)node {
  [[DIOSSession sharedSession] postPath:[NSString stringWithFormat:@"%@/%@", kDiosEndpoint, kDiosBaseNode] parameters:node success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(nodeUpdateDidFinish:operation:response:error:)]) {
      [_delegate nodeUpdateDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this post so my response will never be used.", _delegate);
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(nodeUpdateDidFinish:operation:response:error:)]) {
      [_delegate nodeUpdateDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this post so my response will never be used.", _delegate);
    }
  }];
}
- (void)nodeSaveDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}

#pragma mark nodeUpdate
- (void)nodeUpdate:(NSDictionary *)node {
  [[DIOSSession sharedSession] putPath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosBaseNode, [node objectForKey:@"cid"]] parameters:node success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(nodeUpdateDidFinish:operation:response:error:)]) {
      [_delegate nodeUpdateDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this put so my response will never be used.", _delegate);
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(nodeUpdateDidFinish:operation:response:error:)]) {
      [_delegate nodeUpdateDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this put so my response will never be used.", _delegate);
    }
  }];
}
- (void)nodeUpdateDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}

#pragma mark nodeDelete
- (void)nodeDelete:(NSDictionary *)node {
  [[DIOSSession sharedSession] deletePath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosBaseNode, [node objectForKey:@"cid"]] parameters:node success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(nodeDeleteDidFinish:operation:response:error:)]) {
      [_delegate nodeDeleteDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this delete so my response will never be used.", _delegate);
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(nodeDeleteDidFinish:operation:response:error:)]) {
      [_delegate nodeDeleteDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this delete so my response will never be used.", _delegate);
    }
  }];
}
- (void)nodeDeleteDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
#pragma mark nodeIndex
//Simpler method if you didnt want to build the params :)
- (void)nodeIndexWithPage:(NSString *)page fields:(NSString *)fields parameters:(NSArray *)parameteres pageSize:(NSString *)pageSize {
  NSMutableDictionary *nodeIndexDict = [NSMutableDictionary new];
  [nodeIndexDict setValue:page forKey:@"page"];
  [nodeIndexDict setValue:fields forKey:@"fields"];
  [nodeIndexDict setValue:parameteres forKey:@"parameters"];
  [nodeIndexDict setValue:pageSize forKey:@"pagesize"];  
  [self nodeIndex:nodeIndexDict];
}

- (void)nodeIndex:(NSDictionary *)params {
  [[DIOSSession sharedSession] getPath:[NSString stringWithFormat:@"%@/%@", kDiosEndpoint, kDiosBaseNode] parameters:params success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(nodeIndexDidFinish:operation:response:error:)]) {
      [_delegate nodeIndexDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this delete so my response will never be used.", _delegate);
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(nodeIndexDidFinish:operation:response:error:)]) {
      [_delegate nodeIndexDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this delete so my response will never be used.", _delegate);
    }
  }];
}
- (void)nodeIndexDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
@end
