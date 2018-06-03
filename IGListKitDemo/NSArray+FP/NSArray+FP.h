//
//  NSArray+FP.h
//  youxueyun
//
//  Created by gxy on 16/12/29.
//  Copyright © 2016年 gxy. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef T(^<#name#>)(<#arguments#>);



@interface NSArray<ObjectType> (FP)

- (NSArray *)map : (id(NS_NOESCAPE ^)(ObjectType element))block;
- (NSMutableArray *)mutableMap:(id(NS_NOESCAPE ^)(ObjectType element))block;

///数组展开 element的类型是数组元素的元素类型
- (NSArray *)flatMap:(id(NS_NOESCAPE ^)(id element))block;

- (NSArray<ObjectType> *)filter:(BOOL(NS_NOESCAPE ^)(ObjectType element))block;

///去除重复元素
- (NSArray<ObjectType> *)filterRepeat;

///相当于swift的reduce函数
- (id)reduceWithInitialResult:(id)initialResult nextPartialResult:(id (^)(id result, ObjectType element))nextPartialResult;

- (NSArray<ObjectType> *)dropFirst;
@end
