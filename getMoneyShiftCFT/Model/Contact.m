//
//  Contact.m
//  getMoney
//
//  Created by Родион Баглай on 31.01.18.
//  Copyright © 2018 Родион Баглай. All rights reserved.
//

#import "Contact.h"

@interface Contact()

@end

@implementation Contact


- (instancetype)initWithName:(NSString*) firstName andLastName:(NSString*) lastName andPhone:(NSString*) phone andImage:(NSData*) image
{
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.phone =  phone;
        self.image = image;
       
    }
    return self;
}


// NSKeyedArchiver for NSUserDefaults

-(void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    
    [aCoder encodeObject:self.firstName forKey:@"firstName"];
      [aCoder encodeObject:self.lastName forKey:@"lastName"];
      [aCoder encodeObject:self.phone forKey:@"phone"];
      [aCoder encodeObject:self.image forKey:@"image"];
}

-(nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    
    NSString* firstName = [aDecoder decodeObjectForKey:@"firstName"];
    NSString* lastName = [aDecoder decodeObjectForKey:@"lastName"];
    NSString* phone = [aDecoder decodeObjectForKey:@"phone"];
    NSData* image = [aDecoder decodeObjectForKey:@"image"];
    
    return [self initWithName:firstName andLastName:lastName andPhone:phone andImage:image];
}




@end

