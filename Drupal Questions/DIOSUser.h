//
//  DIOSUser.h
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import "AFHTTPRequestOperation.h"
#import "DIOSSession.h"
@protocol DIOSUserDelegate;
@protocol DIOSUserDelegate <NSObject>
- (void)userGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)userSaveDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)userUpdateDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)userDeleteDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)userIndexDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)userLoginDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
- (void)userLogoutDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
@end

@interface DIOSUser : NSObject <DIOSUserDelegate>{
  id <DIOSUserDelegate> delegate;
}
@property (weak, nonatomic) id <DIOSUserDelegate> delegate;
- (id) initWithDelegate:(id<DIOSUserDelegate>)aDelegate;
- (void)userGet:(NSDictionary *)user;
- (void)userSave:(NSDictionary *)user;
- (void)userUpdate:(NSDictionary *)user;
- (void)userDelete:(NSDictionary *)user;
- (void)userIndexWithPage:(NSString *)page fields:(NSString *)fields parameters:(NSArray *)parameteres pageSize:(NSString *)pageSize;
- (void)userIndex:(NSDictionary *)params;
- (void)userLogin:(NSDictionary *)user;
- (void)userLoginWithUsername:(NSString *)username andPassword:(NSString *)password;
- (void)userLogout;
@end
