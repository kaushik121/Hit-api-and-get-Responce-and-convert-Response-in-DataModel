//
//  ViewController.m
//  Hit_API_AFNetworing
//
//  Created by Leo on 3/21/17.
//  Copyright © 2017 Leo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://shagunn.info/cherishws/mobileapi/listMenus" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
     */

    NSDictionary *dictionaryParameter = @{@"product_id":@"4147",
                                          @"custom_id":@"SI-IJ",
                                          @"gcolor":@"Yellow",
                                          @"size":@"7",
                                          @"customer_id":@"102",
                                          @"metal_purity":@"18"};
    NSLog(@"%@",dictionaryParameter);
    [[APIManagerNew sharedAPIManager] hitAPIuserRegistrationParameters:dictionaryParameter currentView:self.view completionHandlerSuccess:^(NSDictionary *dictionaryResponse) {
        NSLog(@"%@",dictionaryResponse);

        ProductDetailDataModel *productDetailDataModelObject = [[ProductDetailDataModel alloc]initWithDictionary:[dictionaryResponse valueForKey:@"data"]];
        NSLog(@"%@",productDetailDataModelObject);



    } completionHandlerFailure:^(NSError *error) {
        NSLog(@"%@",error);
    }];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
