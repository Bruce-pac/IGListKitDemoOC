//
//  DataTool+Json.m
//
//
//  Created by gxy on 16/8/9.
//  Copyright © 2016年 gxy. All rights reserved.
//

#import "JsonTool.h"



@implementation JsonTool
+ (NSArray *)arrayWithJson:(NSString *)jsonPath {
    NSURL *url   = [[NSBundle mainBundle] URLForResource:jsonPath withExtension:@"json"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    if (!data) {
        return @[];
    }
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    return array;
}

+ (NSDictionary *)dicWithJson:(NSString *)jsonPath {
    NSURL *url   = [[NSBundle mainBundle] URLForResource:jsonPath withExtension:@"json"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    if (!data) {
        return @{};
    }
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    return dic;
}
@end
