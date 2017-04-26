//
//  AppConnections.m
//
//  Created by Esraa iMac on 12/17/16.
//  Copyright © 2016 Itc-international. All rights reserved.
//

#import "AppConnections.h"

@implementation AppConnections
static AppConnections *sharedInstance = nil;
static dispatch_once_t onceToken;
+ (instancetype)sharedInstance {
    
    
    dispatch_once(&onceToken, ^{
        
        
        sharedInstance = [[AppConnections alloc] initWithBaseURL:[NSURL URLWithString:URL_UNI_BASE_WEB_SERVICE]];
        
        
        //  NSLog(@"%@",[[(NSDictionary *)_sharedClient valueForKey:@"response"]valueForKey:@"allHeaderFields"]);
         // sharedInstance.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        // [_sharedClient setSecurityPolicy:[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey]];
        // _sharedClient.securityPolicy.allowInvalidCertificates = YES;
        
        
    });
    return sharedInstance;
}
-(BOOL)isInternetOn{
    
    return [AFNetworkReachabilityManager sharedManager].reachable;
}
-(void)showProgress{

   // [[AppDelegate appDelegate].window.rootViewController.view.rn_activityView  show:YES];
}
-(void)hideProgress{
    
    //[[AppDelegate appDelegate].window.rootViewController.view.rn_activityView  hide:YES];

    
}
- (void)requestWithAPI:(NSString *)APIUrl
            parameters:(NSDictionary *)parameters
            completion:(void(^)(id))completion{
    
    [self requestWithAPI:APIUrl parameters:parameters showProgress:YES headerField:nil completion:completion];
    
}


- (void)requestWithAPI:(NSString *)APIUrl
            parameters:(NSDictionary *)parameters
          showProgress:(BOOL)showProgress
           headerField:(NSDictionary *)header
            completion:(void(^)(id))completion{

    
    
    
    if (showProgress)
        [self showProgress];
    
    
    if (![self isInternetOn]){
#warning ahow alert to inform the user about no internet connection
        
        
        [AppDrawer showAlertWithTitle:nil  withMessage:@"please check the internet connection"  withButton:@"Ok"];
        [self hideProgress];
        completion(nil);
        return;
    }
    
    
    
    
    if (parameters){
        
        [self requestPost:APIUrl parameters:parameters completion:completion headerField:header];
        
    }else{
        
        [self requestGet:APIUrl completion:completion headerField:header];
        
    }
    
}

-(void)requestPost:(NSString *)APIUrl
        parameters:(NSDictionary *)parameters
        completion:(void(^)(id))completion
       headerField:(NSDictionary *)header{
    

 
   // sharedInstance.responseSerializer.acceptableStatusCodes = [NSIndexSet indexSetWithIndex:400];

    self.responseSerializer.acceptableStatusCodes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 300)];

    for (int i=0;i<header.allValues.count;i++){
        
        [sharedInstance.requestSerializer setValue:header.allValues[i] forHTTPHeaderField:header.allKeys[i]];
        
        
    }
    


    [sharedInstance POST:APIUrl
             parameters:parameters
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    
                    NSLog(@"\n\n responseObject %@",responseObject);
                    
                    

                    [self hideProgress];
                    completion(responseObject);
                    
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    
                    NSLog(@"\n\n error %@",error);
                    
                    
                    [self hideProgress];
                    
                    
                }];
    
    
    
    
    
    
}

-(void)requestGet:(NSString *)APIUrl
       completion:(void(^)(id))completion
      headerField:(NSDictionary *)header{
    
    
    self.responseSerializer.acceptableStatusCodes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 300)];

    
    if (header){
        
        for (int i=0;i<header.allValues.count;i++){
            
            [sharedInstance.requestSerializer setValue:header.allValues[i] forHTTPHeaderField:header.allKeys[i]];

            
        }
        
        
    }
    
    
    [sharedInstance GET:APIUrl
            parameters:nil
               success:^(AFHTTPRequestOperation *operation, id responseObject) {
                   
                   NSLog(@"\n\n responseObject %@",responseObject);
                   
                   completion(responseObject);
                   [self hideProgress];
                   
                   
               } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                   
                   NSLog(@"\n\n error %@",error);
                  
                   
                   [self hideProgress];
                   
               }];
    
    
}












@end
