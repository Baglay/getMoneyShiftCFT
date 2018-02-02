//
//  MainScreenUI.m
//  getMoneyShiftCFT
//
//  Created by Родион Баглай on 02.02.18.
//  Copyright © 2018 Родион Баглай. All rights reserved.
//

#import "MainScreenUI.h"
#import "IMainScreenUI.h"
#import "UIColor+ColorHEX.h"
#import <UIKit/UIKit.h>
@interface MainScreenUI() <UITextFieldDelegate>


@end

@implementation MainScreenUI

@synthesize buttonClickHandler;
@synthesize cardNumberChangedHandler;
@synthesize amountChangedHandler;


-(void) initConfigure
{
    self.numberCardTextField.delegate = self;
    self.amountTextField.delegate = self;
    [self setupKeyboardNotifications];
}


-(void) clearData {
    self.cardImageView.backgroundColor = [UIColor getUIColorObjectFromHexString:@"e6e6e6" alpha:1.0];
    self.bankLogoImageView.image = nil;
    self.bankTypeCard.image = nil;
}

-(void) displayError:(NSString*) error {
    NSLog(@"ОШИБКА %@",error);
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self endEditing:YES];
}


#pragma mark - UIActions

- (IBAction)buttonGetMoneyClick:(id)sender {
    
    if( nil != self.buttonClickHandler )
    {
        self.buttonClickHandler(self.numberCardTextField.text, self.amountTextField.text);
    }
}

#pragma mark - textFieldDelegate

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *currentString = textField.text;
    NSString *newString = [currentString stringByReplacingCharactersInRange:range withString:string];
    NSInteger newLength = newString.length;
   // NSString *stringWithNotSpace = [newString  stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if(textField == self.numberCardTextField) {
        self.cardNumberChangedHandler(newString);
        
        if (newLength > 16) {
            [textField resignFirstResponder];
        }
    }
    else if (textField == self.amountTextField) {
        return  self.amountChangedHandler(newString);
        
    }
    
    return YES;
}



-(void) setDefaultSettingCard {
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.bankTypeCard.image = nil;
                         self.bankLogoImageView.image = nil;
                         self.cardImageView.backgroundColor = [UIColor getUIColorObjectFromHexString:@"e6e6e6" alpha:1.0];
                     }
                     completion:nil];
    
    
    
    
}

-(void) setPaymentSystemType:(PaymentSystemType) type {
   
    switch (type) {
        case PaymentSystemTypeVisa:
            self.bankTypeCard.image = [UIImage imageNamed:@"visa"];
            break;
            
        case PaymentSystemTypeMasterCard:
            self.bankTypeCard.image = [UIImage imageNamed:@"masterCard"];
            break;
            
        default:
            self.bankTypeCard.image = nil;
            break;
    }
    
}
-(void) setCardBankType:(CardBankType) type {
    switch (type) {
        case CardBankTypeSB:
            self.bankLogoImageView.image = [UIImage imageNamed:@"ru-sberbank"];
            self.cardImageView.backgroundColor = [UIColor getUIColorObjectFromHexString:@"1a9f29" alpha:1.0];
            break;
            
        case CardBankTypeAB:
            self.bankLogoImageView.image = [UIImage imageNamed:@"ru-alfa"];
            self.cardImageView.backgroundColor = [UIColor getUIColorObjectFromHexString:@"ef3124" alpha:1.0];
            break;
            
        default:
            self.bankTypeCard.image = nil;
            self.cardImageView.backgroundColor = [UIColor getUIColorObjectFromHexString:@"e6e6e6" alpha:1.0];
            break;
    }
}

-(void) setupKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void) keyboardDidShow: (NSNotification *)notif   {
    
    if([self.amountTextField isEditing]){
        NSDictionary* info = [notif userInfo];
        CGFloat kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.275];
        CGRect rect = [self bounds];
        rect.origin.y -= kbSize;
        [self setFrame: rect];
        [UIView commitAnimations];
        
    }
    
}

-(void) keyboardDidHide: (NSNotification *)notif {
    NSDictionary* info = [notif userInfo];
    CGFloat kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.275];
    CGRect rect = [self frame];
    if (rect.origin.y == -kbSize) {
        rect.origin.y += kbSize;
    }
    [self setFrame: rect];
    [UIView commitAnimations];
    
}



@end
