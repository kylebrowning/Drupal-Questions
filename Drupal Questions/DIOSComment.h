//
//  DIOSComment.h
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"
#import "DIOSSession.h"
@protocol DIOSCommentDelegate;
@protocol DIOSCommentDelegate <NSObject>
- (void)commentGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)commentPostDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)commentPutDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)commentDeleteDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
@end

@interface DIOSComment : NSObject <DIOSCommentDelegate>{
  id <DIOSCommentDelegate> delegate;
}
@property (weak, nonatomic) id <DIOSCommentDelegate> delegate;
- (id) initWithDelegate:(id<DIOSCommentDelegate>)aDelegate;
- (void)commentGet:(NSDictionary *)comment;
- (void)commentPost:(NSDictionary *)comment;
- (void)commentPut:(NSDictionary *)comment;
- (void)commentDelete:(NSDictionary *)comment;
@end
