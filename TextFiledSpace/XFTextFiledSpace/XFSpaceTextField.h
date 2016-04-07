//
//  XFSpaceTextField.h
//  TextFiledSpace
//
//  Created by yinxiangfu on 16/4/6.
//  Copyright © 2016年 xiangfu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFSpaceTextField : UITextField

/**
 *  改变前的内容
 */
@property (nonatomic, copy) NSString    *previousTextFieldContent;

/**
 *  改变前的光标
 */
@property (nonatomic, copy) UITextRange *previousTextFieldTextRange;

@end
