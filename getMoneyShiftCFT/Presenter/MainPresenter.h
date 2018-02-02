//
//  MainPresenter.h
//  getMoneyShiftCFT
//
//  Created by Родион Баглай on 02.02.18.
//  Copyright © 2018 Родион Баглай. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMainScreenUI.h"
@interface MainPresenter : NSObject

@property (nonatomic, copy, readwrite) void (^shouldCollectMoneyHandler)(NSString* cardNumber, NSString* amount);

- (instancetype)setUI:(id<IMainScreenUI>)view;


@end
