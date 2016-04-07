//
//  XFSpaceTextField.m
//  TextFiledSpace
//
//  Created by yinxiangfu on 16/4/6.
//  Copyright © 2016年 xiangfu. All rights reserved.
//

#import "XFSpaceTextField.h"

@interface XFSpaceTextField ()



@end

@implementation XFSpaceTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (void)textFieldChange:(UITextField *)textField
{
    //当前光标位置
    NSUInteger nowPosition = [textField offsetFromPosition:textField.beginningOfDocument toPosition:self.selectedTextRange.start];
    //留下纯数字
    NSString *pureNumberString = [self pureNumberWithString:textField.text andNowPosition:&nowPosition];
    
    if (pureNumberString.length > 11) {
        //超过限制位数结束
        textField.text = self.previousTextFieldContent;
        textField.selectedTextRange = self.previousTextFieldTextRange;
        return;
    }
    
    //插入空格
    NSString *numberAndSpaceString = [self insertSpace:pureNumberString andNowPosition:&nowPosition];
    
    textField.text = numberAndSpaceString;

    UITextPosition *textPosition = [textField positionFromPosition:textField.beginningOfDocument offset:nowPosition];
    textField.selectedTextRange = [textField textRangeFromPosition:textPosition toPosition:textPosition];
}

/**
 *  除掉非数字字符，移动光标到相应的位置上
 *
 *  @param string      字符串
 *  @param nowPosition 当前光标位置
 *
 *  @return 纯数字
 */
- (NSString *)pureNumberWithString:(NSString *)string andNowPosition:(NSUInteger *)nowPosition
{
    //原始数值
    NSUInteger originalPosition = *nowPosition;
    NSMutableString *pureNumberString = [NSMutableString string];
    
    for (NSUInteger i = 0; i < string.length; i ++) {
        //提取c字符
        unichar charCobj = [string characterAtIndex:i];
        if (isdigit(charCobj)) {
            //为数字就添加
            //将c字符转化为oc字符串
            NSString *charString = [NSString stringWithCharacters:&charCobj length:1];
            [pureNumberString appendString:charString];
        }else{
            if (i < originalPosition) {
                //修改原指针上的内容（去掉一个字符，光标前移一位）
                (*nowPosition)--;
            }
        }
    }
    return pureNumberString;
}

/**
 *  在相应的位置插入空格
 *
 *  @param string      字符串
 *  @param nowPosition 当前光标位置
 *
 *  @return 处理后的字符串
 */
- (NSString *)insertSpace:(NSString *)string andNowPosition:(NSUInteger *)nowPosition
{
    //原始数值
    NSUInteger originalPosition = *nowPosition;
    //加入空格
    NSMutableString *numberAndSpaceString = [NSMutableString string];
    
    for (NSUInteger i = 0; i < string.length; i ++) {
        
        //在相应的位置插入空格
        if (i == 3 || i == 7) {
            //添加空格
            [numberAndSpaceString appendString:@" "];
            
            if (i < originalPosition) {
                //修改原指针上的内容（添加空格，光标后移一位）
                (*nowPosition)++;
            }
        }
        
        unichar charCobj = [string characterAtIndex:i];
        NSString *charString = [NSString stringWithCharacters:&charCobj length:1];
        [numberAndSpaceString appendString:charString];
    }
    
    return numberAndSpaceString;
}

@end
