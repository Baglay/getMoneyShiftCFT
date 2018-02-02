//
//  PaymentCard.h
//  getMoney
//
//  Created by Родион Баглай on 29.01.18.
//  Copyright © 2018 Родион Баглай. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PaymentSystemType) {
    PaymentSystemTypeVisa ,
    PaymentSystemTypeMasterCard,
    PaymentSystemTypeUnknown
};

typedef NS_ENUM(NSInteger, CardBankType) {
    CardBankTypeSB,
    CardBankTypeAB,
    CardBankTypeTB
};


@interface PaymentCard : NSObject

@property(nonatomic,copy,readonly) NSString *bankNameRu;
@property(nonatomic,copy,readonly) NSString *bankNameEn;
@property(nonatomic,copy,readonly) NSString *backgroundColor;
@property(nonatomic,copy,readonly) NSArray *preffixes;
@property(nonatomic,copy,readonly) NSString* bankLogo;
@property(nonatomic,assign) PaymentSystemType paymentSystemType;
@property(nonatomic,assign) CardBankType cardBankTypes;

- (instancetype)initWithName:(NSString*) name andBackgroundColor:(NSString*) color andPreffixes:(NSArray*) preffixes andBankLogo:(NSString*) bankLogo andCardBankTypes:(CardBankType) cardBankTypes; //andPaymentSystemType:(PaymentSystemType) paymentSystemType;

@end
