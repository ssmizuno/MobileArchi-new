//
//  NSURLConnection+Blocks.h
//  MobileArchi
//
//  Created by 水野 真史 on 12/01/24.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLConnection (BlocksAddition)

+ (void)sendRequest:(NSURLRequest *)request completeBlock: (void (^) (NSData *receivedData))complete errorBlock:(void (^) (NSError *error))error;

@end
