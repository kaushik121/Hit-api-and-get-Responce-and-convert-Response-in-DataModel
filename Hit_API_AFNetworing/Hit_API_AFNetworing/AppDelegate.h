//
//  AppDelegate.h
//  Hit_API_AFNetworing
//
//  Created by Leo on 3/21/17.
//  Copyright © 2017 Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

