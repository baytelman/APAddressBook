//
//  APSocialContact.m
//  SyncBook
//
//  Created by David on 2014-08-01.
//  Copyright (c) 2014 David Muzi. All rights reserved.
//

#import "APSocialProfile.h"
#import <AddressBook/AddressBook.h>

@interface APSocialProfile ()
@property (nonatomic, readwrite) APSocialNetworkType socialNetwork;
@property (nonatomic, readwrite) NSString *username;
@property (nonatomic, readwrite) NSString *userIdentifier;
@property (nonatomic, readwrite) NSURL *url;
@end

@implementation APSocialProfile

#pragma mark - life cycle

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:@(_socialNetwork) forKey:@"socialNetwork"];
    [encoder encodeObject:_username forKey:@"username"];
    [encoder encodeObject:_userIdentifier forKey:@"userIdentifier"];
    [encoder encodeObject:_url forKey:@"url"];
}
- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        _socialNetwork = [[decoder decodeObjectForKey:@"socialNetwork"] integerValue];
        _username = [decoder decodeObjectForKey:@"username"];
        _userIdentifier = [decoder decodeObjectForKey:@"userIdentifier"];
        _url = [decoder decodeObjectForKey:@"url"];
    }
    return self;
}
- (instancetype)initWithSocialDictionary:(NSDictionary *)dictionary
{
    
    if (self = [super init])
    {
        NSString *urlKey = (__bridge_transfer NSString *)kABPersonSocialProfileURLKey;
        NSString *usernameKey = (__bridge_transfer NSString *)kABPersonSocialProfileUsernameKey;
        NSString *userIdKey = (__bridge_transfer NSString *)kABPersonSocialProfileUserIdentifierKey;
        NSString *serviceKey = (__bridge_transfer NSString *)kABPersonSocialProfileServiceKey;
        _url = [NSURL URLWithString:dictionary[urlKey]];
        _username = dictionary[usernameKey];
        _userIdentifier = dictionary[userIdKey];
        _socialNetwork = [self socialNetworkTypeFromString:dictionary[serviceKey]];
    }
    
    return self;
}

#pragma mark - private

- (APSocialNetworkType)socialNetworkTypeFromString:(NSString *)string
{
    if ([string isEqualToString:@"facebook"])
    {
        return APSocialNetworkFacebook;
    }
    else if ([string isEqualToString:@"twitter"])
    {
        return APSocialNetworkTwitter;
    }
    else if ([string isEqualToString:@"linkedin"])
    {
        return APSocialNetworkLinkedIn;
    }
    else
    {
        return APSocialNetworkUnknown;
    }
}

@end
