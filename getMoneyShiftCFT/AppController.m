//
//  AppController.m
//  getMoneyShiftCFT
//
//  Created by Родион Баглай on 02.02.18.
//  Copyright © 2018 Родион Баглай. All rights reserved.
//

#import "AppController.h"
#import "ViewController.h"

@interface AppController()

//@property(nonatomic,strong) NSArray<Contact *> *contactList;

@end

@implementation AppController

{
    UINavigationController* navigationController;
    UIStoryboard *storyboard;
}

- (instancetype)init {
    
    self = [super init];
    storyboard =[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
  
        ViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        navigationController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
        [mainViewController.navigationController.navigationBar setHidden:YES];
        _rootController = navigationController;
    
    return self;
}


@end
