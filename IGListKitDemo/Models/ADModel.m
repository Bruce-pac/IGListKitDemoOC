//
//  ADModel.m
//  IGListKitDemo
//
//  Created by gxy on 2018/6/25.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "ADModel.h"

@implementation ADModel
-(id<NSObject>)diffIdentifier{
    return self;
}

-(BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object{
    return [self isEqual:object];
}
@end
