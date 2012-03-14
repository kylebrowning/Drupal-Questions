//
//  DIOSNode.h
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"
#import "DIOSSession.h"
@protocol DIOSNodeDelegate;
@protocol DIOSNodeDelegate <NSObject>
- (void)nodeGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)nodePostDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)nodePutDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)nodeDeleteDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
@end

@interface DIOSNode : NSObject <DIOSNodeDelegate>{
  id <DIOSNodeDelegate> delegate;
}
@property (weak, nonatomic) id <DIOSNodeDelegate> delegate;
- (id) initWithDelegate:(id<DIOSNodeDelegate>)aDelegate;
- (void)nodeGet:(NSDictionary *)node;
- (void)nodePost:(NSDictionary *)node;
- (void)nodePut:(NSDictionary *)node;
- (void)nodeDelete:(NSDictionary *)node;
@end
