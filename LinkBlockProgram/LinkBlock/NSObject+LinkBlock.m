//
//  NSObject+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "NSObject+LinkBlock.h"
#import <objc/runtime.h>
#import "LinkBlock.h"

@implementation NSObject(LinkBlock)
- (NSObject *(^)())objCopy
{
    return ^(){
        return (NSObject*)[self copy];
    };
}
- (NSObject *(^)())objMutableCopy
{
    return ^(){
        return (NSObject*)[self mutableCopy];
    };
}
- (BOOL (^)(NSObject *))objIsEqual
{
    return ^(NSObject* obj){
        return [self isEqual:obj];
    };
}

- (BOOL (^)( __unsafe_unretained Class))objIsKind
{
    return ^(Class classKind){
        if(!classKind)
            return NO;
        return [self isKindOfClass:classKind];
    };
}
- (BOOL (^)(__unsafe_unretained Class))objIsSubClassOf
{
    return ^(Class classKind){
        if(!classKind)
            return NO;
        return [[self class] isSubclassOfClass:classKind];
    };
}

- (NSObject* (^)(__unsafe_unretained Class))typeForceObj
{
    return ^(Class theClass){
        if(!theClass || !self.objIsKind(theClass)){
            return (NSObject*)[theClass new];
        }else{
            return self;
        }
    };
}

- (BOOL (^)(SEL))objIsResponseSEL
{
    return ^(SEL theSEL){
        if(theSEL){
            if([self respondsToSelector:theSEL])
                return YES;
        }
        return NO;
    };
}


- (NSString *(^)())objToJsonString
{
    return ^(){
        LinkError_VAL_IF(NSObject){
            return (NSString*)@"";
        }
        NSError* error= nil;
        NSData * JSONData = [NSJSONSerialization dataWithJSONObject:_self
                                                            options:kNilOptions
                                                              error:&error];
        if(error)
            return @"\"\"";
        return [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
    };
}

- (Class (^)())objClass
{
    return ^(){
        return [self class];
    };
}

- (NSString *(^)())objClassName
{
    return ^(){
        return NSStringFromClass([self class]);
    };
}

- (NSObject *(^)(id*))set
{
    return ^(id* toValue){
        LinkError_VAL_IF(NSObject){
            *toValue= nil;
        }else{
            *toValue= _self;
        }
        return _self;
    };
}
- (void)setSet:(NSObject *(^)(id*))blockValueTo{};

- (NSString *(^)())objToString
{
    return ^(){
        return [self description];
    };
}
- (void)setObjToString:(NSString *(^)())objToString{};

- (NSObject *(^)())nslog
{
    return ^(){
        LinkError_VAL_IF(NSObject){
            return (NSObject*)_self;
        }
        NSLog(@"%@",_self);
        return _self;
    };
}
- (void)setNslog:(NSObject *(^)())nslog{};

- (id (^)())end
{
    return ^(){
        LinkError_VAL_IF(NSObject){
            return (id)nil;
        }
        return (id)_self;
    };
}
- (void)setEnd:(id(^)())end{};

- (void)setObjCopy:(NSObject *(^)())blockCopy{};
- (void)setObjMutableCopy:(NSObject *(^)())blockMutableCopy{};
- (void)setObjIsEqual:(BOOL (^)(NSObject *))blockIsEqual{};
- (void)setTypeForceObj:(NSObject* (^)(__unsafe_unretained Class))blockTypeKeep{};
- (void)setObjIsResponseSEL:(BOOL (^)(SEL))blockIsResponseSEL{};
- (void)setObjIsKind:(BOOL (^)( __unsafe_unretained Class))blockIsKindOf{}
- (void)setObjIsSubClassOf:(BOOL (^)(__unsafe_unretained Class))blockIsSubClass{};
- (void)setObjToJsonString:(NSString *(^)())blockToJsonString{};
- (void)setObjClass:(Class (^)())blockClass{};
- (void)setObjClassName:(NSString *(^)())blockClassName{};


- (id (^)(NSString *))valueGet
{
    return ^(NSString* key){
        return [self valueForKey:key];
    };
}
- (void)setValueSet:(NSObject *(^)(NSString *, id))valueSet{};

- (NSObject *(^)(NSString *, id))valueSet
{
    return ^(NSString* key, id value){
        [self setValue:value forKey:key];
        return self;
    };
}
- (void)setValueGet:(id (^)(NSString *))valueGet{};

- (id (^)(NSString *))valuePathGet
{
    return ^(NSString* key){
        return [self valueForKeyPath:key];
    };
}
- (void)setValuePathSet:(NSObject *(^)(NSString *, id))valuePathSet{};

- (NSObject *(^)(NSString *, id))valuePathSet
{
    return ^(NSString* key, id value){
        [self setValue:value forKeyPath:key];
        return self;
    };
}
- (void)setValuePathGet:(id (^)(NSString *))valuePathGet{};

#pragma mark - quick use type
- (NSString *(^)())typeIsNSString
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSString:(NSString *(^)())typeIsNSString{};

- (NSMutableString *(^)())typeIsNSMutableString
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSMutableString:(NSMutableString *(^)())typeIsNSMutableString{};

- (NSArray *(^)())typeIsNSArray
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSArray:(NSArray *(^)())typeIsNSArray{};

- (NSMutableArray *(^)())typeIsNSMutableArray
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSMutableArray:(NSMutableArray *(^)())typeIsNSMutableArray{};

- (NSDictionary *(^)())typeIsNSDictionary
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSDictionary:(NSDictionary *(^)())typeIsNSDictionary{};

- (NSMutableDictionary *(^)())typeIsNSMutableDictionary
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSMutableDictionary:(NSMutableDictionary *(^)())typeIsNSMutableDictionary{};

- (NSAttributedString *(^)())typeIsNSAttributedString
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSAttributedString:(NSAttributedString *(^)())typeIsNSAttributedString{};

- (NSMutableAttributedString *(^)())typeIsNSMutableAttributedString
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSMutableAttributedString:(NSMutableAttributedString *(^)())typeIsNSMutableAttributedString{};

- (UIView *(^)())typeIsUIView
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUIView:(UIView *(^)())typeIsUIView{};

- (UILabel *(^)())typeIsUILabel
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUILabel:(UILabel *(^)())typeIsUILabel{};

- (UIControl *(^)())typeIsUIControl
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUIControl:(UIControl *(^)())typeIsUIControl{};

- (UIButton *(^)())typeIsUIButton
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUIButton:(UIButton *(^)())typeIsUIButton{};

- (UIScrollView *(^)())typeIsUIScrollView
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUIScrollView:(UIScrollView *(^)())typeIsUIScrollView{};

- (UIImage *(^)())typeIsUIImage
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUIImage:(UIImage *(^)())typeIsUIImage{};

- (UIColor *(^)())typeIsUIColor
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUIColor:(UIColor *(^)())typeIsUIColor{};

- (UIImageView *(^)())typeIsUIImageView
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUIImageView:(UIImageView *(^)())typeIsUIImageView{};


#pragma mark - extension for func

static const char* blockName = "quxingyiHandsome";
- (void)objBlockSet:(NSString*)name block:(id(^)())executeBlock
{
    if([name isKindOfClass:[NSString class]] && executeBlock)
        [self novoGetBlocksDict][name]= executeBlock;
}
- (id(^)())objBlockGet:(NSString*)name
{
    if(![name isKindOfClass:[NSString class]])
        return (id)^(){return nil;};
    
    id(^block)() = [self novoGetBlocksDict][name];
    if(!block)
        return (id)^(){return nil;};
    
    return (id)block;
}
- (void)objBlockRemove:(NSString*)name
{
    if([name isKindOfClass:[NSString class]])
        [[self novoGetBlocksDict] removeObjectForKey:name];
}
- (id)objBlockExecute:(NSString *)name
{
    if(![name isKindOfClass:[NSString class]])
        return (id)nil;
    id(^block)() = [self novoGetBlocksDict][name];
    if(block)
        return block();
    return (id)nil;
}

- (NSMutableDictionary* )novoGetBlocksDict
{
    NSMutableDictionary *privateDict= objc_getAssociatedObject(self, &blockName);
    if(!privateDict ||
       ![privateDict isKindOfClass:([NSMutableDictionary class])]){
        privateDict= [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, &blockName, privateDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return privateDict;
}

#pragma mark - exteion for uicontrol

/** 触发扩展字典中的的UIControl的事件，不应直接调用 */
- (void)novoExecuteEventForSender:(id)sender
{
    if(![((NSObject*)sender) isKindOfClass:[UIControl class]])
        return;
    
    NSMutableDictionary *privateDict= [(UIControl *)(sender) private__GetPrivateDict];
    if(![privateDict isKindOfClass:[NSMutableDictionary class]])
        return;
    
    NSNumber* targetKey = [NSNumber numberWithUnsignedLongLong: [self hash]];
    NSMutableDictionary *targetDict= privateDict[targetKey];
    if(![targetDict isKindOfClass: [NSMutableDictionary class]])
        return;

    [targetDict enumerateKeysAndObjectsUsingBlock:^(NSNumber* eventName, NSMutableArray* blocks , BOOL *stop) {
        UIControlEvents event= [eventName unsignedIntValue];
        [blocks enumerateObjectsUsingBlock:^(void(^block)(UIControlEvents), NSUInteger idx, BOOL *stop) {
            block(event);
        }];
    }];
}
@end
