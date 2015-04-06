//
//  APPhoneWithLabel.m
//  APAddressBook
//
//  Created by John Hobbs on 2/7/14.
//  Copyright (c) 2014 alterplay. All rights reserved.
//

#import "APPhoneWithLabel.h"

@implementation APPhoneWithLabel

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:_phone forKey:@"phone"];
    [encoder encodeObject:_label forKey:@"label"];
}
- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        _phone = [decoder decodeObjectForKey:@"phone"];
        _label = [decoder decodeObjectForKey:@"label"];
    }
    return self;
}
- (id)initWithPhone:(NSString *)phone label:(NSString *)label {
    self = [super init];
    if(self)
    {
        _phone = phone;
        _label = label;
    }
    return self;
}

@end
