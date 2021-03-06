//
//  NSArray+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "NSArray+LinkBlock.h"
#import "NSObject+LinkBlock.h"
#import "LinkBlock.h"

@implementation NSObject(NSArraryLinkBlock)
- (BOOL (^)(NSString *))arrIsContainerStr
{
    return ^(NSString* str){
        LinkError_VAL_IF(NSArray){
            return NO;
        }
        __block BOOL re= NO;
        [_self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if([obj isKindOfClass:[NSString class]] && [obj isEqualToString:str]){
                re= YES;
                *stop= YES;
            }
        }];
        return re;
    };
}
- (void)setArrIsContainerStr:(BOOL (^)(NSString *))blockContainerStr{};

- (BOOL (^)(NSUInteger))arrIsIndexInRange
{
    return ^(NSUInteger index){
        LinkError_VAL_IF(NSArray){
            return NO;
        }
        return (BOOL)(index< _self.count);
    };
}
- (void)setArrIsIndexInRange:(BOOL (^)(NSUInteger))blockIsIndexInRange{};


- (NSArray *(^)(NSUInteger, NSUInteger))arrObjsFromIndexTo
{
    return ^(NSUInteger idx1, NSUInteger idx2){
        LinkError_REF_AUTO(NSArray, NSArray);
        if(idx1>idx2 || idx1> _self.count-1)
            return (NSArray *)([NSArray new]);

        if(idx2> _self.count-1)
            idx2= _self.count - 1;
        NSUInteger loc = idx1;
        NSUInteger len = idx2 - idx1 + 1;
        return [_self subarrayWithRange:NSMakeRange(loc, len)];
    };
}
- (void)setArrObjsFromIndexTo:(NSArray *(^)(NSUInteger, NSUInteger))blockObjsFromIndexTo{};

- (NSDictionary *(^)())arrToDictByKeyNumber
{
    return ^(){
        LinkError_REF_AUTO(NSDictionary, NSArray);
        NSMutableDictionary* reIsDictM= [NSMutableDictionary dictionary];
        [_self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [reIsDictM setObject:obj forKey:@(idx)];
        }];
        return (NSDictionary*)[reIsDictM copy];
    };
}
- (void)setArrToDictByKeyNumber:(NSDictionary *(^)())blockArrToDictByNumberKey{};

- (NSDictionary *(^)())arrToDictByKeyString
{
    return ^(){
        LinkError_REF_AUTO(NSDictionary, NSArray);
        NSMutableDictionary* reIsDictM= [NSMutableDictionary dictionary];
        [_self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [reIsDictM setObject:obj forKey:[NSString stringWithFormat:@"%lu", (unsigned long)idx]];
        }];
        return (NSDictionary*)[reIsDictM copy];
    };
}
- (void)setArrToDictByKeyString:(NSDictionary *(^)())blockArrToDictByStringKey{};

- (BOOL (^)(id))arrIsContainer
{
    return ^(id obj){
        LinkError_VAL_IF(NSArray){
            return NO;
        }
        return [_self containsObject:obj];
    };
}
- (void)setArrIsContainer:(BOOL (^)(id))blockContainer{};


- (id (^)(NSUInteger))arrValueAt
{
    return ^(NSUInteger idx){
        LinkError_VAL_IF(NSArray){
            return (id)nil;
        }
        id re;
        if(_self.arrIsIndexInRange(idx)){
            re = [_self objectAtIndex:idx];
        }else{
            re = nil;
        }
        return re;
    };
}
- (void)setArrValueAt:(id (^)(NSUInteger))blockValue{};

- (id (^)(__unsafe_unretained Class ,NSUInteger))arrValueAtType
{
    return ^( Class typeClass, NSUInteger idx){
        LinkError_VAL_IF(NSArray){
            return (id)nil;
        }
        id re;
        if(_self.arrIsIndexInRange(idx)){
            re = [_self objectAtIndex:idx];
            if(!typeClass || ![re isKindOfClass:typeClass]){
                re = [typeClass new];
            }
        }else{
            re = [typeClass new];
        }
        return re;
    };
}
- (void)setArrValueAtType:(id (^)(__unsafe_unretained Class ,NSUInteger))blockValueType{};

- (NSObject *(^)(NSUInteger))arrValueAtNSObject
{
    return ^(NSUInteger idx){
        LinkError_REF_AUTO(NSObject, NSArray);
        return (NSObject*)_self.arrValueAtType([NSObject class],idx);
    };
}
- (void)setArrValueAtNSObject:(NSObject *(^)(NSUInteger))blockValueNSObject{};

- (NSString *(^)(NSUInteger))arrValueAtNSString
{
    return ^(NSUInteger idx){
        LinkError_REF_AUTO(NSString, NSArray);
        return (NSString*)_self.arrValueAtType([NSString class],idx);
    };
}
- (void)setArrValueAtNSString:(NSString *(^)(NSUInteger))blockValueNSString{};

- (NSNumber *(^)(NSUInteger))arrValueAtNSNumber
{
    return ^(NSUInteger idx){
        LinkError_REF_AUTO(NSNumber, NSArray);
        return (NSNumber*)_self.arrValueAtType([NSNumber class],idx);
    };
}
- (void)setArrValueAtNSNumber:(NSNumber *(^)(NSUInteger))blockValueNSNumber{};

- (NSArray *(^)(NSUInteger))arrValueAtNSArrary
{
    return ^(NSUInteger idx){
        LinkError_REF_AUTO(NSArray, NSArray);
        return (NSArray*)_self.arrValueAtType([NSArray class],idx);
    };
}
- (void)setArrValueAtNSArrary:(NSArray *(^)(NSUInteger))blockValueNSArrary{};

- (NSMutableArray *(^)(NSUInteger))arrValueAtNSMutableArray
{
    return ^(NSUInteger idx){
        LinkError_REF_AUTO(NSMutableArray, NSArray);
        return (NSMutableArray*)_self.arrValueAtType([NSMutableArray class],idx);
    };
}
- (void)setArrValueAtNSMutableArray:(NSMutableArray *(^)(NSUInteger))blockValueNSMutableArray{};

- (NSDictionary *(^)(NSUInteger))arrValueAtNSDictionary
{
    return ^(NSUInteger idx){
        LinkError_REF_AUTO(NSDictionary, NSArray);
        return (NSDictionary*)_self.arrValueAtType([NSDictionary class],idx);
    };
}
- (void)setArrValueAtNSDictionary:(NSDictionary *(^)(NSUInteger))blockValueNSDictionary{};

- (NSMutableDictionary *(^)(NSUInteger))arrValueAtNSMutableDictionary
{
    return ^(NSUInteger idx){
        LinkError_REF_AUTO(NSMutableDictionary, NSArray);
        return (NSMutableDictionary*)_self.arrValueAtType([NSMutableDictionary class],idx);
    };
}
- (void)setArrValueAtNSMutableDictionary:(NSMutableDictionary *(^)(NSUInteger))blockValueNSMutableDictionary{};

- (UIView *(^)(NSUInteger))arrValueAtUIVIew
{
    return ^(NSUInteger idx){
        LinkError_REF_AUTO(UIView, NSArray);
        return (UIView*)_self.arrValueAtType([UIView class],idx);
    };
}
- (void)setArrValueAtUIVIew:(UIView *(^)(NSUInteger))blockValueUIVIew{};

- (NSArray *(^)(__unsafe_unretained Class))arrValuesOfType
{
    return ^(__unsafe_unretained Class typeClass){
        LinkError_REF_AUTO(NSArray, NSArray);
        if(!typeClass)
            return _self;
        NSMutableArray* reIsMArr = [NSMutableArray array];
        [_self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if([obj isKindOfClass:typeClass]){
                [reIsMArr addObject:obj];
            }
        }];
        return (NSArray*)reIsMArr.objCopy();
    };
}
- (void)setArrValuesOfType:(NSArray *(^)(__unsafe_unretained Class))blockValuesOfType{};

- (NSArray *(^)(NSString *))arrFilter
{
    return ^(NSString* predicateFormat){
        LinkError_REF_AUTO(NSArray, NSArray);
        return [_self filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:predicateFormat]];
    };
}
- (void)setArrFilter:(NSArray *(^)(NSString *))arrFilter{};



- (void)arrEnumerateWithPredicateFormat:(NSString *)predicateFormat
                                  usingBlock:(void (^)(id, NSUInteger, BOOL *))block
{
    LinkError_VAL_IF(NSArray){
        return;
    }
    NSMutableArray* re= [NSMutableArray new];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:predicateFormat];
    [_self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([predicate evaluateWithObject:obj]){
            [re addObject:obj];
            if(block){
                block(obj, idx, &*stop);
            }
        }
    }];
}
@end
