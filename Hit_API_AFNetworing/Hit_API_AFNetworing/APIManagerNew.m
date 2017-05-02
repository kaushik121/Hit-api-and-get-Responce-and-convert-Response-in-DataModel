//
//  APIManagerNew.m
//  Hit_API_AFNetworing
//
//  Created by Leo on 3/21/17.
//  Copyright © 2017 Leo. All rights reserved.
//

#import "APIManagerNew.h"

@implementation APIManagerNew

#define USE_PRODUCTION_URL 0
#if USE_PRODUCTION_URL
static NSString *const BASE_URL = @"http://cherishgold.com/cherishws/";
#else
static NSString *const BASE_URL = @"http://shagunn.info/cherishws/";
#endif


NSString *const USERREGISTRATION = @"webservices/userRegistration";


+ (APIManagerNew *)sharedAPIManager{
    static APIManagerNew *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[APIManagerNew alloc]init];
    });
    return sharedInstance;

    //    static NetworkManager *sharedNetworkManager = nil;
    //    static dispatch_once_t oncePredicate;
    //    dispatch_once(&oncePredicate, ^{
    //
    //        sharedNetworkManager = [[self alloc]initWithBaseURL:[NSURL URLWithString:SERVER_URL]];
    //        [sharedNetworkManager setupServerConnection];
    //        [sharedNetworkManager.reachabilityManager startMonitoring];
    //
    //    });
    //
    //    return sharedNetworkManager;
}


- (void)hitAPIuserRegistrationParameters:(NSDictionary *)dictionaryParameters currentView:(UIView *)view completionHandlerSuccess:(void (^)(NSDictionary *dictionaryResponse))success completionHandlerFailure:(void (^)(NSError *error))failure{
    NSLog(@"%@",dictionaryParameters);

    if ([Utility_ObjectiveC isInternetConnected_ShowPopupIfNotConnected:true]){
        [MBProgressHUD showHUDAddedTo:view animated:true];
        self.manager = [AFHTTPSessionManager manager];
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        [self.manager.requestSerializer setValue:@"0a04775a6632aa79877659e5e6cd00dda67bf937_020254001488365421" forHTTPHeaderField:@"Auth-Token"];

        [self.manager GET:[NSString stringWithFormat:@"%@%@",BASE_URL,@"mobileapi/product_detail"] parameters:dictionaryParameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            [MBProgressHUD hideHUDForView:view animated:true];
            NSLog(@"JSON: %@", responseObject);

//            BaseClass *baseClassObject = [[BaseClass alloc]initWithDictionary:responseObject];
//            NSLog(@"%@",baseClassObject);
//
//            NSLog(@"%@",baseClassObject.data);
//            NSLog(@"%@",[[baseClassObject.data objectAtIndex:0] valueForKey:@"productId"]);

            ProductDetailDataModel *productDetailDataModelObject = [[ProductDetailDataModel alloc]initWithDictionary:[responseObject valueForKey:@"data"]];
            NSLog(@"%@",productDetailDataModelObject);


            success(responseObject);
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            [MBProgressHUD hideHUDForView:view animated:true];
            NSLog(@"Error: %@", error);
            [Utility_ObjectiveC showAlertControllerwithTitle:nil Message:[error localizedDescription]];
            failure(error);
        }];

    }


}





@end
