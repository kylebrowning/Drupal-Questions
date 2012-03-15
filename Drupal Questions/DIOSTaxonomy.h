//
//  DIOSTaxonomy.h
//  Drupal Questions
//
//  Created by Kyle Browning on 3/14/12.
//  Copyright (c) 2012 Grasscove. All rights reserved.
//

#import "AFHTTPRequestOperation.h"
#import "DIOSSession.h"
@protocol DIOSTaxonomyDelegate;

@protocol DIOSTaxonomyDelegate <NSObject>;
- (void)getTreeDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)selectNodesDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)getTermDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
@end

@interface DIOSTaxonomy : NSObject <DIOSTaxonomyDelegate> {
  id <DIOSTaxonomyDelegate> delegate;
}
@property (weak, nonatomic) id <DIOSTaxonomyDelegate> delegate;
- (id) init;
- (id) initWithDelegate:(id<DIOSTaxonomyDelegate>)aDelegate;
- (void)getTreeWithParams:(NSDictionary *)params;
- (void)getTreeWithVid:(NSString *)vid withParent:(NSString *)parent andMaxDepth:(NSString *)maxDepth;
- (void)selectNodesWithParams:(NSDictionary *)params;
- (void)selectNodesWithTid:(NSString *)tid andLimit:(NSString *)limit andPager:(NSString *)pager andOrder:(NSString *)order;
- (void)getTermWithTid:(NSString *)tid;
@end