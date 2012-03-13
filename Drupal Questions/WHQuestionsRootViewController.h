//
//  WHQuestionsRootViewController.h
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DIOSNode.h"
@interface WHQuestionsRootViewController : UITableViewController <DIOSSessionDelegate>
- (void)success:(AFHTTPRequestOperation *)operation response:(id)response;
- (void)failure:(AFHTTPRequestOperation *)operation error:(NSError *)error;
@end
