//
//  DIOSSession.m
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import "DIOSSession.h"
#import "AFJSONRequestOperation.h"
#import "AFPropertyListRequestOperation.h"

@implementation DIOSSession
@synthesize delegate, user;
+ (DIOSSession *)sharedSession {
  static dispatch_once_t once;
  static DIOSSession *sharedSession;
  dispatch_once(&once, ^ { 
    sharedSession = [[self alloc] initWithBaseURL:[NSURL URLWithString:kDiosBaseUrl]];
    [sharedSession setParameterEncoding:AFJSONParameterEncoding];
  });
  return sharedSession;
}

- (id)initWithBaseURL:(NSURL *)url {
  self = [super initWithBaseURL:url];
  if (!self) {
    return nil;
  }
  
  [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
  [self setDelegate:self];
  // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
  [self setDefaultHeader:@"Content-Type" value:@"application/json"];
	
  return self;
}
- (void)callDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  if(status) {
    //success!
    NSString *localizedStatusCodeString = [NSHTTPURLResponse localizedStringForStatusCode:[[operation response] statusCode]];
    DLog(@"SUCCESS: %d %@ %@, %@", [[operation response] statusCode], localizedStatusCodeString, [operation responseString], response);
  } else {
    //something happened im sorry!
    //    DLog(@"%@", [[operation response] allHeaderFields]);
    NSString *localizedStatusCodeString = [NSHTTPURLResponse localizedStringForStatusCode:[[operation response] statusCode]];
    DLog(@"FAILED: %d %@ %@ %@ %@", [[operation response] statusCode], localizedStatusCodeString, [operation responseString], response, operation);
  }
}
@end
