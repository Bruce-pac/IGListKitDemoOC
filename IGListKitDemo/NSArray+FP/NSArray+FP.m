//
//  NSArray+FP.m
//  youxueyun
//
//  Created by gxy on 16/12/29.
//  Copyright © 2016年 gxy. All rights reserved.
//

#import "NSArray+FP.h"



@implementation NSArray (FP)

- (NSArray *)filterRepeat {
    NSSet *  set    = [NSSet setWithArray:self];
    NSArray *result = [set allObjects];
    return result;
}

- (NSArray *)map:(id (^)(id))block {
    NSMutableArray *newArray = [NSMutableArray array];
    if (!block) {
        return self;
    }
    for (id element in self) {
        [newArray addObject:block(element)];
    }
    return newArray;
}

- (NSMutableArray *)mutableMap:(id (^)(id))block {
    NSMutableArray *newArray = [NSMutableArray array];
    if (!block) {
        return self.mutableCopy;
    }
    for (id element in self) {
        [newArray addObject:block(element)];
    }
    return newArray;
}

- (NSArray *)flatMap:(id (^)(id))block {
    NSMutableArray *newArr = [NSMutableArray array];
    if (!block) {
        return self;
    }
    return [self reduceWithInitialResult:newArr
                       nextPartialResult:^NSMutableArray *(NSMutableArray *result, id element) {
                         if ([element isKindOfClass:[NSArray class]]) {
                             __kindof NSArray *arr = element;
                             [result addObjectsFromArray:[arr map:^id(id aElement) {
                                       return block(aElement);
                                     }]];
                         } else {
                             [result addObject:block(element)];
                         }
                         return result;
                       }];
}

- (NSArray *)filter:(BOOL (^)(id))block {
    NSMutableArray *newArray = [NSMutableArray array];
    if (!block) {
        return self;
    }
    for (id element in self) {
        if (block(element)) {
            [newArray addObject:element];
        }
    }
    return newArray;
}

- (id)reduceWithInitialResult:(id)initialResult nextPartialResult:(id (^)(id, id))nextPartialResult {
    id result = initialResult;
    for (id element in self) {
        result = nextPartialResult(result, element);
    }
    return result;
}

- (NSArray *)dropFirst {
    if (self.count == 0 ||
        self.count == 1) {
        return @[];
    }
    return [self subarrayWithRange:NSMakeRange(1, self.count - 1)];
}
@end
