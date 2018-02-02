//
//  CardValidator.m
//  getMoney
//
//  Created by Родион Баглай on 29.01.18.
//  Copyright © 2018 Родион Баглай. All rights reserved.
//

#import "CardValidator.h"
#import "CardManager.h"

@implementation CardValidator

-(void) validateCard:(NSString*) cardNumber {
    
    NSArray* cards = [CardManager getAllCard];
    for (PaymentCard *obj in cards) {
        for (NSString *preffix in obj.preffixes) {
            if([cardNumber hasPrefix:preffix] && cardNumber != nil) {
                if([cardNumber hasPrefix:@"4"]){
                    obj.paymentSystemType = PaymentSystemTypeVisa;
                }
                else if([cardNumber hasPrefix:@"51"] || [cardNumber hasPrefix:@"52"] || [cardNumber hasPrefix:@"53"] || [cardNumber hasPrefix:@"54"] || [cardNumber hasPrefix:@"55"]){
                     obj.paymentSystemType = PaymentSystemTypeMasterCard;
             
                }
                else {
                    obj.paymentSystemType = PaymentSystemTypeUnknown;
                }
                
                   [self handleCardType:obj];
            }
        }
        
    }
    
}



-(void) handleCardType:(id) data
{
    _card = (PaymentCard*) data;
    _completionHandler();
    
}

@end
