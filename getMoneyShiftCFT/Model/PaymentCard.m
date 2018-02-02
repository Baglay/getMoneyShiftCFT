//
//  PaymentCard.m
//  getMoney
//
//  Created by Родион Баглай on 29.01.18.
//  Copyright © 2018 Родион Баглай. All rights reserved.
//

#import "PaymentCard.h"



@interface PaymentCard()

@property(nonatomic,copy,readwrite) NSString *bankNameRu;
@property(nonatomic,copy,readwrite) NSString *bankNameEn;
@property(nonatomic,copy,readwrite) NSString *backgroundColor;
@property(nonatomic,copy,readwrite) NSArray *preffixes;
@property(nonatomic,copy,readwrite) NSString* bankLogo;

@end


@implementation PaymentCard

- (instancetype)initWithName:(NSString*) name andBackgroundColor:(NSString*) color andPreffixes:(NSArray*) preffixes andBankLogo:(NSString *)bankLogo andCardBankTypes:(CardBankType) cardBankTypes //andPaymentSystemType:(PaymentSystemType) paymentSystemType;
{
    self = [super init];
    if (self) {
        self.bankNameRu = name;
        self.backgroundColor = color;
        self.preffixes =  [NSArray arrayWithArray:preffixes];
        self.bankLogo = bankLogo;
        self.cardBankTypes = cardBankTypes;
        //self.paymentSystemType = paymentSystemType;
    }
    return self;
}



@end
