//
//  WHQuestionsRootViewController.h
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DIOSNode.h"
#import "DIOSComment.h"
#import "DIOSUser.h"
#import "DIOSTaxonomy.h"
#import "DIOSFile.h"
#import "WHQuestionCell.h"
@interface WHQuestionsRootViewController : UITableViewController <DIOSNodeDelegate, DIOSCommentDelegate, DIOSUserDelegate, DIOSTaxonomyDelegate, DIOSFileDelegate> {
}

#pragma mark node delegate methods
- (void)nodeGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)nodeSaveDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)nodeUpdateDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)nodeDeleteDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)nodeIndexDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
#pragma mark comment delegate methods
- (void)commentGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)commentSaveDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)commentUpdateDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)commentDeleteDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)commentIndexDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
#pragma mark user delegate methods
- (void)userGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)userSaveDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)userUpdateDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)userDeleteDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)userIndexDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)userLoginDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)userLogoutDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
@end
