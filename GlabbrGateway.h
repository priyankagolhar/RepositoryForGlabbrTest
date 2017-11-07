//
//  GlabbrGateway.h
//  GlabbrTest
//
//  Created by Apple on 11/5/17.
//  Copyright © 2017 chiselcut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlabbrGateway : NSObject<NSCoding>
@property (assign,nonatomic) int cuid;
@property (assign,nonatomic) int anyIntegerValue;
@property (assign,nonatomic) long anyLongValue;
@property (strong,nonatomic) NSString  *titleString;
-(id)initWith:(int)cuid i:(int)anyIntegerValue l:(long)anyLongValue S:(NSString*)titleString;
@end
