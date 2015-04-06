//
//  APAddress.m
//  AddressBook
//
//  Created by Alexey Belkevich on 4/19/14.
//  Copyright (c) 2014 alterplay. All rights reserved.
//

#import <AddressBook/AddressBook.h>
#import "APAddress.h"

@implementation APAddress

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:_street forKey:@"street"];
    [encoder encodeObject:_city forKey:@"city"];
    [encoder encodeObject:_state forKey:@"state"];
    [encoder encodeObject:_zip forKey:@"zip"];
    [encoder encodeObject:_country forKey:@"country"];
    [encoder encodeObject:_countryCode forKey:@"countryCode"];
}
- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        _street = [decoder decodeObjectForKey:@"street"];
        _city = [decoder decodeObjectForKey:@"city"];
        _state = [decoder decodeObjectForKey:@"state"];
        _zip = [decoder decodeObjectForKey:@"zip"];
        _country = [decoder decodeObjectForKey:@"country"];
        _countryCode = [decoder decodeObjectForKey:@"countryCode"];
    }
    return self;
}
- (id)initWithAddressDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        _street = dictionary[(__bridge NSString *)kABPersonAddressStreetKey];
        _city = dictionary[(__bridge NSString *)kABPersonAddressCityKey];
        _state = dictionary[(__bridge NSString *)kABPersonAddressStateKey];
        _zip = dictionary[(__bridge NSString *)kABPersonAddressZIPKey];
        _country = dictionary[(__bridge NSString *)kABPersonAddressCountryKey];
        _countryCode = dictionary[(__bridge NSString *)kABPersonAddressCountryCodeKey];
    }
    return self;
}

@end
