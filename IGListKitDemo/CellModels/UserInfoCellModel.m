//
//  UserInfoCellModel.m
//  IGListKitDemo
//
//  Created by gxy on 2018/5/28.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "UserInfoCellModel.h"

@implementation UserInfoCellModel
-(instancetype)initWithUserName:(NSString *)userName{
    self = [super init];
    if (self) {
        _userName = userName;
    }
    return self;
}
@end
