//
//  NSURLConnection+Blocks.m
//  MobileArchi
//
//  Created by 水野 真史 on 12/01/24.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSURLConnection+Blocks.h"

@interface NSURLConnectionBlocksAddtionDelegate : NSObject {
    
@private
    NSMutableData *receivedData;
    void (^completeBlock) (NSData *receivedData);
    void (^errorBlock) (NSError *error);
}

- (id)initWithCompleteBlock:(void (^)(NSData *receivedData))complete errorBlock:(void (^)(NSError *error))error;
@end

@implementation NSURLConnectionBlocksAddtionDelegate

- (id)initWithCompleteBlock:(void (^)(NSData *))complete errorBlock:(void (^)(NSError *))error {
    self = [super init];
    if (self) {
        receivedData = [[NSMutableData alloc] init];
        completeBlock = complete;
        errorBlock = error;        
    }
    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    completeBlock(receivedData);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    errorBlock(error);
}

@end

@implementation NSURLConnection(BlocksAddition)

+(void)sendRequest:(NSURLRequest *)request completeBlock:(void (^)(NSData *))complete errorBlock:(void (^)(NSError *))error {
    
    id delegate = [[NSURLConnectionBlocksAddtionDelegate alloc] initWithCompleteBlock:complete errorBlock:error];
    [self connectionWithRequest:request delegate:delegate];
}

@end
