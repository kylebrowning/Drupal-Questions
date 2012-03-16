//
//  DIOSSession.h
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"
#import "Settings.h"
@protocol DIOSSessionDelegate;

@protocol DIOSSessionDelegate <NSObject>
- (void)callDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
@end

@interface DIOSSession : AFHTTPClient <DIOSSessionDelegate>{
  id <DIOSSessionDelegate> delegate;
  NSDictionary *user;
}
@property (strong, nonatomic) id <DIOSSessionDelegate> delegate;
@property (strong, nonatomic) NSDictionary *user;
+ (DIOSSession *)sharedSession;
@end

