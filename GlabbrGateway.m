//
//  GlabbrGateway.m
//  GlabbrTest
//
//  Created by Apple on 11/5/17.
//  Copyright © 2017 chiselcut. All rights reserved.
//

#import "GlabbrGateway.h"

@implementation GlabbrGateway
-(id)initWith:(int)cuid i:(int)anyIntegerValue l:(long)anyLongValue S:(NSString *)titleString
{
    self = [super init];
    if (self) {
    _cuid = cuid;
    _anyIntegerValue = anyIntegerValue;
    _anyLongValue =anyLongValue;
    _titleString = titleString;
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _anyIntegerValue = [[aDecoder decodeObjectForKey:@"intValue"]intValue];
        _anyLongValue = [[aDecoder decodeObjectForKey:@"longValue"]intValue];
        _cuid =  [[aDecoder decodeObjectForKey:@"cuid"]intValue];
        _titleString = [aDecoder decodeObjectForKey:@"stringValue"];
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[NSNumber numberWithInt:_anyIntegerValue] forKey:@"intValue"];
    [aCoder encodeObject:[NSNumber numberWithLong:_anyLongValue] forKey:@"longValue"];
    [aCoder encodeObject:[NSNumber numberWithInt:_cuid] forKey:@"cuid"];
    [aCoder encodeObject:_titleString forKey:@"stringValue"];
}
@end
