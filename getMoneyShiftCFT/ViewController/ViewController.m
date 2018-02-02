//
//  ViewController.m
//  getMoneyShiftCFT
//
//  Created by Родион Баглай on 02.02.18.
//  Copyright © 2018 Родион Баглай. All rights reserved.
//

#import "ViewController.h"
#import "MainPresenter.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

{
    MainPresenter *presenter;
    UIStoryboard *storyBoard;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    presenter = [[MainPresenter alloc] init];
    [presenter setUI:self.view];
    
    presenter.shouldCollectMoneyHandler = ^(NSString *cardNumber, NSString *amount) {
        NSLog(@"переходим на другой контроллер");
        storyBoard = [UIStoryboard storyboardWithName:@"" bundle:[NSBundle mainBundle]];
        DetailViewController *detailVC = [storyBoard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        [self.navigationController pushViewController:detailVC animated:YES];
    };
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
