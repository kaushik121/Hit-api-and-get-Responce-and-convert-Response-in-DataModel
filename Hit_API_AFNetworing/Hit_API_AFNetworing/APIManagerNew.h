//
//  APIManagerNew.h
//  Hit_API_AFNetworing
//
//  Created by Leo on 3/21/17.
//  Copyright © 2017 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#import "Utility_ObjectiveC.h"
#import "AFNetworking.h"
#import "ProductDetailAllDataModels.h"

@interface APIManagerNew : NSObject

@property AFHTTPSessionManager *manager;


+ (APIManagerNew *)sharedAPIManager;
- (void)hitAPIuserRegistrationParameters:(NSDictionary *)dictionaryParameters currentView:(UIView *)view completionHandlerSuccess:(void (^)(NSDictionary *dictionaryResponse))success completionHandlerFailure:(void (^)(NSError *error))failure;

@end
