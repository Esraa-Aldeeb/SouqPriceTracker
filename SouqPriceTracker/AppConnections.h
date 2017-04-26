//
//  AppConnections.h
//
//  Created by Esraa iMac on 12/17/16.
//  Copyright © 2016 Itc-international. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

@interface AppConnections : AFHTTPRequestOperationManager{
}


+ (instancetype)sharedInstance;

- (void)requestWithAPI:(NSString *)APIUrl
            parameters:(NSDictionary *)parameters
          showProgress:(BOOL)showProgress
           headerField:(NSDictionary *)header
            completion:(void(^)(id))completion;



- (void)requestWithAPI:(NSString *)APIUrl
            parameters:(NSDictionary *)parameters
            completion:(void(^)(id))completion;





@end
