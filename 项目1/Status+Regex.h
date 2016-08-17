//
//  Status+Regex.h
//  项目1
//
//  Created by Leonlincq on 16/8/12.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Status.h"

@interface Status (Regex)

typedef unsigned int LCQKeyChoose;  //键盘按键范围
enum
{
    LCQKeyChoose_onlyNumb           = 0x00,         //只能是数字
    LCQKeyChoose_onlyChar           = 0x01,         //只能是英语
    LCQKeyChoose_onlyNumbCharCross  = 0x02,         //只能是用户名（数字、字母、下划线）
    LCQKeyChoose_onlyEmail          = 0x03,         //只能是邮箱名
    LCQKeyChoose_onlyPhoneNumb      = 0x04,         //只能是手机号码
    LCQKeyChoose_onlyAdmin          = 0x05,         //只能是Admin
    LCQKeyChoose_onlyYesOrNo        = 0x06,         //只能是Yes或No
    LCQKeyChoose_onlyYes            = 0x07,         //只能是Yes
    LCQKeyChoose_onlyNo             = 0x08,         //只能是No
    LCQKeyChoose_allKeyValue        = 0xFF          //可以是任意按键值
    
};


typedef NSUInteger LCQKeyStatu;
enum
{
    LCQKeyStatu_NO      = 0x00,
    LCQKeyStatu_YES     = 0x01,
    LCQKeyStatu_POINT   = 0x02,
};

-(BOOL)isValidateNumb:(NSString *)numb;
-(BOOL)isValidateChar:(NSString *)string;
-(BOOL)isValidateName:(NSString *)name;
-(BOOL)isValidateThreePoint:(NSString *)data;
-(BOOL)isValidateComma:(NSString *)data;
-(BOOL)isValidateAdmin:(NSString *)data;
-(BOOL)isValidateYesOrNo:(NSString *)data;
-(BOOL)isValidateYes:(NSString *)data;
-(BOOL)isValidateNo:(NSString *)data;
-(BOOL)isValidateEmail:(NSString *)email;
-(BOOL)isValidatePhone:(NSString *)phone;


/** 判断数据的键值是否合法 */
-(LCQKeyStatu)inputDataAndSaveIn:(NSString**)data andJudge:(LCQKeyChoose)numbchar;

@end
