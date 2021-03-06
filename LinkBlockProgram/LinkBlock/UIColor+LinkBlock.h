//
//  UIColor+LinkBlock.h

//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject(UIColorLinkBlock)
/** 返回如0xc3c3c3 , #c3c3c3 , c3c3c3 */
@property (nonatomic,copy) NSString*        (^colorToStrWithPrefix)(NSString* prefix);
@property (nonatomic,copy) CGFloat          (^colorRed)();
@property (nonatomic,copy) CGFloat          (^colorGreen)();
@property (nonatomic,copy) CGFloat          (^colorBlue)();
@property (nonatomic,copy) CGFloat          (^colorAlpha)();
/** return new UIColor */
@property (nonatomic,copy) UIColor*         (^colorRedSet)(CGFloat value);
@property (nonatomic,copy) UIColor*         (^colorGreenSet)(CGFloat value);
@property (nonatomic,copy) UIColor*         (^colorBlueSet)(CGFloat value);
@property (nonatomic,copy) UIColor*         (^colorAlphaSet)(CGFloat value);
@end
