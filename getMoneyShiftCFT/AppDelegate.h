//
//  AppDelegate.h
//  getMoneyShiftCFT
//
//  Created by Родион Баглай on 02.02.18.
//  Copyright © 2018 Родион Баглай. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

