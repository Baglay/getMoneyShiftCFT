//
//  MainScreenUI.h
//  getMoneyShiftCFT
//
//  Created by Родион Баглай on 02.02.18.
//  Copyright © 2018 Родион Баглай. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMainScreenUI.h"

@interface MainScreenUI : UIView <IMainScreenUI>

@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bankLogoImageView;

@property (weak, nonatomic) IBOutlet UIImageView *bankTypeCard;

@property (weak, nonatomic) IBOutlet UITextField *amountTextField;

@property (weak, nonatomic) IBOutlet UITextField *numberCardTextField;


@end
