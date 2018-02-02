//
//  MainPresenter.m
//  getMoneyShiftCFT
//
//  Created by Родион Баглай on 02.02.18.
//  Copyright © 2018 Родион Баглай. All rights reserved.
//

#import "MainPresenter.h"
#import "MainScreenUI.h"
#import "CardValidator.h"
#import "PaymentCard.h"

@interface MainPresenter()

@property(nonatomic,strong) CardValidator *validator;
@end

@implementation MainPresenter

{
    MainScreenUI *mainScreenUI;
    //CardValidator *validator;
    PaymentCard* card;
}




- (instancetype)setUI:(id<IMainScreenUI>)ui {
    
    [ui clearData];
    [ui initConfigure];
    typeof (ui) __weak weakUi = ui;
    
    ui.cardNumberChangedHandler = ^(NSString *cardNumber) {
        if([self identificationBankForCardNumber:cardNumber]) {
            PaymentSystemType psType = card.paymentSystemType;;
            CardBankType cbType = card.cardBankTypes;;
            
            [weakUi setPaymentSystemType:psType];
            [weakUi setCardBankType:cbType];
            
            
        }
        else {
            [weakUi setDefaultSettingCard];
        }
    };
    
    
    ui.amountChangedHandler = ^(NSString *amount) {
        return [self formattingAmount:amount];
    };
    
    ui.buttonClickHandler = ^(NSString *cardNumber, NSString *amount) {
       
        NSLog(@"Я нажал кнопку и получил значения %@ %@",cardNumber,amount);
        [self handleShouldColletMoney];
        
    };
    
    return self;
}

- (void)handleShouldColletMoney
{
    self.shouldCollectMoneyHandler = ^(NSString *cardNumber, NSString *amount) {
        NSLog(@"Переходим на другой контроллер");
    };
}








//formatting amount textField

-(BOOL) formattingAmount:(NSString *)amount {
    
    if (amount.length < 8){
        if([amount isEqualToString:@""]) {
            return YES;
        }
        NSError *error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[1-9]" options:NSRegularExpressionCaseInsensitive error:&error];
        NSTextCheckingResult *match = [regex firstMatchInString:amount options:0 range:NSMakeRange(0, [amount length])];
        BOOL isMatch = match != nil;
        return isMatch;
    }
    return NO;
}


//identification bankLogo and typeCard

-(BOOL) identificationBankForCardNumber:(NSString*) cardNumber {
    _validator = [[CardValidator alloc] init];
    _validator.completionHandler = ^{
        card = _validator.card;
    };
    [_validator validateCard:cardNumber];
    return _validator.card != nil ? YES :NO;
}

@end
