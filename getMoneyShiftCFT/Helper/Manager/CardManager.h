//
//  CardManager.h
//  getMoney
//
//  Created by Родион Баглай on 29.01.18.
//  Copyright © 2018 Родион Баглай. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentCard.h"
@interface CardManager : NSObject

+ (NSArray<PaymentCard *> *)getAllCard;

@end
