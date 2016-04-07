//
//  ViewController.m
//  TextFiledSpace
//
//  Created by yinxiangfu on 16/4/6.
//  Copyright © 2016年 xiangfu. All rights reserved.
//

#import "ViewController.h"
#import "XFSpaceTextField.h"

@interface ViewController () <UITextFieldDelegate>
@property (nonatomic, strong) XFSpaceTextField *spaceTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    XFSpaceTextField *spaceTextField = [[XFSpaceTextField alloc] initWithFrame:CGRectMake(100, 200, 200, 40)];
    spaceTextField.placeholder = @"请输入手机号";
    spaceTextField.borderStyle = UITextBorderStyleRoundedRect;
    spaceTextField.keyboardType = UIKeyboardTypeNumberPad;
    [spaceTextField becomeFirstResponder];
    spaceTextField.delegate = self;
    [self.view addSubview:spaceTextField];
    self.spaceTextField = spaceTextField;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    self.spaceTextField.previousTextFieldContent = textField.text;
    self.spaceTextField.previousTextFieldTextRange = textField.selectedTextRange;
    return YES;
}

@end
