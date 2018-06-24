//
//  FeedModel.m
//  IGListKitDemo
//
//  Created by gxy on 2018/5/28.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "FeedModel.h"
#import <MJExtension.h>

@implementation FeedModel

+(NSDictionary *)mj_objectClassInArray{
    return @{
             @"comments":[Comment class]
             };
}

-(id<NSObject>)diffIdentifier{
    return self;
}

-(BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object{
    return [self isEqual:object];
}
@end
