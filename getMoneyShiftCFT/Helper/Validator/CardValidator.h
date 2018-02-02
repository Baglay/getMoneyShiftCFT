//
//  CardValidator.h
//  getMoney
//
//  Created by Родион Баглай on 29.01.18.
//  Copyright © 2018 Родион Баглай. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentCard.h"



@interface CardValidator : NSObject

@property(nonatomic,copy) PaymentCard* card;

@property (nonatomic, copy) void (^completionHandler)(void);

-(void) validateCard:(NSString*) cardNumber;

@end
