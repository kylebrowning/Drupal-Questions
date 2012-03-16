//
//  DIOSFile.h
//  Drupal Questions
//
//  Created by Kyle Browning on 3/15/12.
//  Copyright (c) 2012 Grasscove. All rights reserved.
//

#import "AFHTTPRequestOperation.h"
#import "DIOSSession.h"
@protocol DIOSFileDelegate;

@protocol DIOSFileDelegate <NSObject>;
- (void)fileGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error;
@end

@interface DIOSFile : NSObject <DIOSFileDelegate> {
  id <DIOSFileDelegate> delegate;
}
@property (weak, nonatomic) id <DIOSFileDelegate> delegate;
- (id) init;
- (id) initWithDelegate:(id<DIOSFileDelegate>)aDelegate;
- (void) fileGet:(NSDictionary *)params;
- (UIImageView *) getImageViewForFileImage:(NSDictionary *) file;
@end