//
//  UIColor+ColorHEX.h
//  getMoneyShiftCFT
//
//  Created by Родион Баглай on 03.02.18.
//  Copyright © 2018 Родион Баглай. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorHEX)

+(UIColor *) getUIColorObjectFromHexString:(NSString *)hexStr alpha:(CGFloat)alpha;
+(unsigned int)intFromHexString:(NSString *)hexStr;

@end
