//
//  DIOSComment.m
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import "DIOSComment.h"

@implementation DIOSComment
@synthesize delegate = _delegate;
- (id) init {
  self = [super init];
  if (!self) {
    return nil;
  }
  [self setDelegate:self];
  return self;
}
- (id) initWithDelegate:(id<DIOSCommentDelegate>)aDelegate {
  self = [super init];
  if (!self) {
    return nil;
  }
  [self setDelegate:aDelegate];
  return self;
}

#pragma mark CommentGets
- (void)commentGet:(NSDictionary *)comment {
  [[DIOSSession sharedSession] getPath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosBaseComment, [comment objectForKey:@"cid"]] parameters:nil success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(commentGetDidFinish:operation:response:error:)]) {
      [_delegate commentGetDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate for this get so my response will never be used.");
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(commentGetDidFinish:operation:response:error:)]) {
      [_delegate commentGetDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate for this get so my response will never be used.");
    }
  }];
}
- (void)commentGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  DIOSSession *session = [DIOSSession sharedSession];
  [[session delegate] callDidFinish:status operation:operation response:response error:error];
}

#pragma mark CommentPosts
- (void)commentPost:(NSDictionary *)comment {
  [[DIOSSession sharedSession] postPath:[NSString stringWithFormat:@"%@/%@", kDiosEndpoint, kDiosBaseComment] parameters:comment success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(commentPostDidFinish:operation:response:error:)]) {
      [_delegate commentPostDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate for this post so my response will never be used.");
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(commentPostDidFinish:operation:response:error:)]) {
      [_delegate commentPostDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate for this post so my response will never be used.");
    }
  }];
}
- (void)commentPostDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}

#pragma mark CommentPut
- (void)commentPut:(NSDictionary *)comment {
  [[DIOSSession sharedSession] putPath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosBaseComment, [comment objectForKey:@"cid"]] parameters:comment success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(commentPutDidFinish:operation:response:error:)]) {
      [_delegate commentPutDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate for this put so my response will never be used.");
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(commentPutDidFinish:operation:response:error:)]) {
      [_delegate commentPutDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate for this put so my response will never be used.");
    }
  }];
}
- (void)commentPutDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}

#pragma mark CommentDelete
- (void)commentDelete:(NSDictionary *)comment {
  [[DIOSSession sharedSession] deletePath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosBaseComment, [comment objectForKey:@"cid"]] parameters:comment success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(commentDeleteDidFinish:operation:response:error:)]) {
      [_delegate commentDeleteDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate for this delete so my response will never be used.");
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(commentDeleteDidFinish:operation:response:error:)]) {
      [_delegate commentDeleteDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate for this delete so my response will never be used.");
    }
  }];
}
- (void)commentDeleteDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
@end