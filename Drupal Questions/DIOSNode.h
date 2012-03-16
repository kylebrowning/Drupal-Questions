//
//  DIOSNode.h
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import "AFHTTPRequestOperation.h"
#import "DIOSSession.h"
@protocol DIOSNodeDelegate;
@protocol DIOSNodeDelegate <NSObject>
- (void)nodeGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)nodeSaveDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)nodeUpdateDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)nodeDeleteDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)nodeIndexDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)nodeAttachFileDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;

@end

@interface DIOSNode : NSObject <DIOSNodeDelegate>{
  id <DIOSNodeDelegate> delegate;
}
@property (weak, nonatomic) id <DIOSNodeDelegate> delegate;
- (id) initWithDelegate:(id<DIOSNodeDelegate>)aDelegate;
- (void)nodeGet:(NSDictionary *)node;
- (void)nodeSave:(NSDictionary *)node;
- (void)nodeUpdate:(NSDictionary *)node;
- (void)nodeDelete:(NSDictionary *)node;
- (void)nodeIndexWithPage:(NSString *)page fields:(NSString *)fields parameters:(NSArray *)parameteres pageSize:(NSString *)pageSize;
- (void)nodeIndex:(NSDictionary *)params;
- (void)nodeAttachFile:(NSDictionary *)params;
@end
