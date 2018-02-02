//
//  IMainScreenUI.h
//  getMoneyShiftCFT
//
//  Created by Родион Баглай on 02.02.18.
//  Copyright © 2018 Родион Баглай. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentCard.h"
@protocol IMainScreenUI <NSObject>

@property (nonatomic, copy, readwrite) void (^buttonClickHandler)(NSString* cardNumber,NSString* amount);
@property (nonatomic,copy,readwrite) void (^cardNumberChangedHandler)(NSString* cardNumber);
@property (nonatomic,copy,readwrite) BOOL (^amountChangedHandler)(NSString* amount);

-(void) initConfigure;
-(void) clearData;
-(void) displayError:(NSString*) error;
-(void) setDefaultSettingCard;

-(void) setPaymentSystemType:(PaymentSystemType) type;
-(void) setCardBankType:(CardBankType) type;

@end
