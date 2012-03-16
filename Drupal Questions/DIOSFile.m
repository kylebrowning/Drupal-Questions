//
//  DIOSFile.m
//  Drupal Questions
//
//  Created by Kyle Browning on 3/15/12.
//  Copyright (c) 2012 Grasscove. All rights reserved.
//

#import "DIOSFile.h"
#import "UIImageView+AFNetworking.h"
@implementation DIOSFile
@synthesize delegate = _delegate;
- (id) init {
  self = [super init];
  if (!self) {
    return nil;
  }
  [self setDelegate:self];
  return self;
}
- (id) initWithDelegate:(id<DIOSFileDelegate>)aDelegate {
  self = [super init];
  if (!self) {
    return nil;
  }
  [self setDelegate:aDelegate];
  return self;
}
- (void) fileGet:(NSDictionary *)params {
  [[DIOSSession sharedSession] getPath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosBaseFile, [params objectForKey:@"fid"]] parameters:params success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(fileGetDidFinish:operation:response:error:)]) {
      [_delegate fileGetDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this get so my response will never be used.", _delegate);
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(fileGetDidFinish:operation:response:error:)]) {
      [_delegate fileGetDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this get so my response will never be used.", _delegate);
    }
  }];
}
- (void) fileGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void) fileSave:(NSDictionary *)params {
  //currently doesnt work :(
}
- (UIImageView *) getImageViewForFileImageField:(NSDictionary *) file { 
  NSURL *url = [NSURL URLWithString:[file objectForKey:@"uri_full"]];
  UIImageView *remoteImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
  [remoteImage setImageWithURL:url];
  return remoteImage;
}
@end
