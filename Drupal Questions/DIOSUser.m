//
//  DIOSUser.m
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import "DIOSUser.h"

@implementation DIOSUser
@synthesize delegate = _delegate;
- (id) init {
  self = [super init];
  if (!self) {
    return nil;
  }
  [self setDelegate:self];
  return self;
}
- (id) initWithDelegate:(id<DIOSUserDelegate>)aDelegate {
  self = [super init];
  if (!self) {
    return nil;
  }
  [self setDelegate:aDelegate];
  return self;
}

#pragma mark UserGets
- (void)userGet:(NSDictionary *)user {
  [[DIOSSession sharedSession] getPath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosBaseUser, [user objectForKey:@"uid"]] parameters:nil success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(userGetDidFinish:operation:response:error:)]) {
      [_delegate userGetDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this get so my response will never be used.", _delegate);
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(userGetDidFinish:operation:response:error:)]) {
      [_delegate userGetDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this get so my response will never be used.", _delegate);
    }
  }];
}
- (void)userGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  DIOSSession *session = [DIOSSession sharedSession];
  [[session delegate] callDidFinish:status operation:operation response:response error:error];
}

#pragma mark userSaves
- (void)userSave:(NSDictionary *)user {
  [[DIOSSession sharedSession] postPath:[NSString stringWithFormat:@"%@/%@", kDiosEndpoint, kDiosBaseUser] parameters:user success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(userSaveDidFinish:operation:response:error:)]) {
      [_delegate userSaveDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this post so my response will never be used.", _delegate);
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(userSaveDidFinish:operation:response:error:)]) {
      [_delegate userSaveDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this post so my response will never be used.", _delegate);
    }
  }];
}
- (void)userSaveDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}

#pragma mark userUpdate
- (void)userUpdate:(NSDictionary *)user {
  [[DIOSSession sharedSession] putPath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosBaseUser, [user objectForKey:@"uid"]] parameters:user success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(userUpdateDidFinish:operation:response:error:)]) {
      [_delegate userUpdateDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this put so my response will never be used.", _delegate);
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(userUpdateDidFinish:operation:response:error:)]) {
      [_delegate userUpdateDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this put so my response will never be used.", _delegate);
    }
  }];
}
- (void)userUpdateDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}

#pragma mark UserDelete
- (void)userDelete:(NSDictionary *)user {
  [[DIOSSession sharedSession] deletePath:[NSString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, kDiosBaseUser, [user objectForKey:@"uid"]] parameters:user success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(userDeleteDidFinish:operation:response:error:)]) {
      [_delegate userDeleteDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this delete so my response will never be used.", _delegate);
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(userDeleteDidFinish:operation:response:error:)]) {
      [_delegate userDeleteDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this delete so my response will never be used.", _delegate);
    }
  }];
}
- (void)userDeleteDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}

#pragma mark userIndex
//Simpler method if you didnt want to build the params :)
- (void)userIndexWithPage:(NSString *)page fields:(NSString *)fields parameters:(NSArray *)parameteres pageSize:(NSString *)pageSize {
  NSMutableDictionary *userIndexDict = [NSMutableDictionary new];
  [userIndexDict setValue:page forKey:@"page"];
  [userIndexDict setValue:fields forKey:@"fields"];
  [userIndexDict setValue:parameteres forKey:@"parameters"];
  [userIndexDict setValue:pageSize forKey:@"pagesize"];  
  [self userIndex:userIndexDict];
}

- (void)userIndex:(NSDictionary *)params {
  [[DIOSSession sharedSession] getPath:[NSString stringWithFormat:@"%@/%@", kDiosEndpoint, kDiosBaseUser] parameters:params success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(userIndexDidFinish:operation:response:error:)]) {
      [_delegate userIndexDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this delete so my response will never be used.", _delegate);
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(userIndexDidFinish:operation:response:error:)]) {
      [_delegate userIndexDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this delete so my response will never be used.", _delegate);
    }
  }];
}
- (void)userIndexDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}

#pragma mark userLogin
- (void)userLoginWithUsername:(NSString *)username andPassword:(NSString *)password {
  NSDictionary *params = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:username, password, nil] forKeys:[NSArray arrayWithObjects:@"username", @"password", nil]];
  [[DIOSSession sharedSession] postPath:[NSString stringWithFormat:@"%@/%@/login", kDiosEndpoint, kDiosBaseUser] parameters:params success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(userLoginDidFinish:operation:response:error:)]) {
      [[DIOSSession sharedSession] setUser:JSON];
      [_delegate userLoginDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this delete so my response will never be used.", _delegate);
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(userLoginDidFinish:operation:response:error:)]) {
      [_delegate userLoginDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this delete so my response will never be used.", _delegate);
    }
  }];
}
- (void)userLogin:(NSDictionary *)user {
  [self userLoginWithUsername:[user objectForKey:@"name"] andPassword:[user objectForKey:@"pass"]];
}
- (void)userLoginDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
#pragma mark userLogout
- (void)userLogout {
  [[DIOSSession sharedSession] postPath:[NSString stringWithFormat:@"%@/%@/logout", kDiosEndpoint, kDiosBaseUser] parameters:nil success:^(__unused AFHTTPRequestOperation *operation, id JSON) {
    if ([_delegate respondsToSelector:@selector(userLogoutDidFinish:operation:response:error:)]) {
      [[DIOSSession sharedSession] setUser:nil];
      [_delegate userLogoutDidFinish:YES operation:operation response:JSON error:nil];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this delete so my response will never be used.", _delegate);
    }
  } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
    if ([_delegate respondsToSelector:@selector(userLogoutDidFinish:operation:response:error:)]) {
      [_delegate userLogoutDidFinish:NO operation:operation response:nil error:error];
    } else {
      DLog(@"I couldnt find the delegate and one was set %@ for this delete so my response will never be used.", _delegate);
    }
  }];
}
- (void)userLogoutDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
@end