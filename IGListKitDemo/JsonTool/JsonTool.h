//
//  JsonTool+Json.h
//  
//
//  Created by gxy on 16/8/9.
//  Copyright © 2016年 gxy. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JsonTool : NSObject
+ (nullable NSArray *)arrayWithJson:(nonnull NSString *)jsonPath;
+ (nullable NSDictionary *)dicWithJson:(nonnull NSString *)jsonPath;
@end
