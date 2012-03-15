//
//  DIOSTaxonomy.m
//  Drupal Questions
//
//  Created by Kyle Browning on 3/14/12.
//  Copyright (c) 2012 Grasscove. All rights reserved.
//

#import "DIOSTaxonomy.h"

@implementation DIOSTaxonomy
@synthesize delegate = _delegate;
- (id) init {
  self = [super init];
  if (!self) {
    return nil;
  }
  [self setDelegate:self];
  return self;
}
- (id) initWithDelegate:(id<DIOSTaxonomyDelegate>)aDelegate {
  self = [super init];
  if (!self) {
    return nil;
  }
  [self setDelegate:aDelegate];
  return self;
}

- (void)getTreeWithVid:(NSString *)vid withParent:(NSString *)parent andMaxDepth:(NSString *)maxDepth {
  NSMutableDictionary *params = [NSMutableDictionary new];
  [params setValue:vid forKey:@"vid"];
  [params setValue:parent forKey:@"parent"];
  [params setValue:maxDepth forKey:@"max_depth"];
  [self getTreeWithParams:params];
}
- (void)getTreeWithParams:(NSDictionary *)params {
  [[DIOSSession sharedSession] postPath:[NSString stringWithFormat:@"%@/%@/getTree", kDiosEndpoint, kDiosBaseTaxonmyVocabulary] parameters:params success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(getTreeDidFinish:operation:response:error:)]) {
      [_delegate getTreeDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this post so my response will never be used.", _delegate);
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(getTreeDidFinish:operation:response:error:)]) {
      [_delegate getTreeDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this post so my response will never be used.", _delegate);
    }
  }];
}
- (void)selectNodesWithTid:(NSString *)tid andLimit:(NSString *)limit andPager:(NSString *)pager andOrder:(NSString *)order {
  NSMutableDictionary *params = [NSMutableDictionary new];
  [params setValue:tid forKey:@"tid"];
  [params setValue:limit forKey:@"limit"];
  [params setValue:pager forKey:@"pager"];
  [params setValue:order forKey:@"prder"];
  [self selectNodesWithParams:params];
}
- (void)selectNodesWithParams:(NSDictionary *)params {
  [[DIOSSession sharedSession] postPath:[NSString stringWithFormat:@"%@/%@/selectNodes", kDiosEndpoint, kDiosBaseTaxonmyTerm] parameters:params success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(selectNodesDidFinish:operation:response:error:)]) {
      [_delegate selectNodesDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this post so my response will never be used.", _delegate);
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(selectNodesDidFinish:operation:response:error:)]) {
      [_delegate selectNodesDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this post so my response will never be used.", _delegate);
    }
  }];
}
- (void)getTermWithTid:(NSString *)tid {
  [[DIOSSession sharedSession] getPath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosBaseTaxonmyTerm, tid] parameters:nil success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(getTreeDidFinish:operation:response:error:)]) {
      [_delegate getTreeDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this get so my response will never be used.", _delegate);
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(getTreeDidFinish:operation:response:error:)]) {
      [_delegate getTreeDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this get so my response will never be used.", _delegate);
    }
  }];
}
- (void)getTreeDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)selectNodesDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)getTermDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
@end
