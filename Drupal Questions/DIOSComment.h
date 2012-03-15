//
//  DIOSComment.h
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import "AFHTTPRequestOperation.h"
#import "DIOSSession.h"
@protocol DIOSCommentDelegate;
@protocol DIOSCommentDelegate <NSObject>
- (void)commentGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)commentSaveDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)commentUpdateDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)commentDeleteDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)commentIndexDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
@end

@interface DIOSComment : NSObject <DIOSCommentDelegate>{
  id <DIOSCommentDelegate> delegate;
}
@property (weak, nonatomic) id <DIOSCommentDelegate> delegate;
- (id) initWithDelegate:(id<DIOSCommentDelegate>)aDelegate;
- (void)commentGet:(NSDictionary *)comment;
- (void)commentSave:(NSDictionary *)comment;
- (void)commentUpdate:(NSDictionary *)comment;
- (void)commentDelete:(NSDictionary *)comment;
- (void)commentIndexWithPage:(NSString *)page fields:(NSString *)fields parameters:(NSArray *)parameteres pageSize:(NSString *)pageSize;
- (void)commentIndex:(NSDictionary *)params;
@end
