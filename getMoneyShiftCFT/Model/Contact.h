//
//  Contact.h
//  getMoney
//
//  Created by Родион Баглай on 31.01.18.
//  Copyright © 2018 Родион Баглай. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject <NSCoding>

@property(nonatomic,copy) NSString *firstName;
@property(nonatomic,copy) NSString *lastName;
@property(nonatomic,copy) NSString *phone;
@property(nonatomic,copy) NSData  *image;

@end
