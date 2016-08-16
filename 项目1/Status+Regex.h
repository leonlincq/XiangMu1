//
//  Status+Regex.h
//  项目1
//
//  Created by etcxm on 16/8/12.
//  Copyright © 2016年 etc. All rights reserved.
//

#import "Status.h"

@interface Status (Regex)

typedef unsigned int LCQKeyChoose;  //键盘按键范围
enum
{
    onlyNumb            = 0x00,         //只能是数字
    onlyChar            = 0x01,         //只能是英语
    onlyNumbCharCross   = 0x02,         //只能是用户名（数字、字母、下划线）
    onlyEmail           = 0x03,         //只能是邮箱名
    onlyPhoneNumb       = 0x04,         //只能是手机号码
    onlyadmin           = 0x05,         //只能是admin
    allKeyValue         = 0xFF          //可以是任意按键值
};


typedef NSUInteger LCQKeyStatu;
enum
{
    LCQKeyStatu_NO      = 0x00,
    LCQKeyStatu_YES     = 0x01,
    LCQKeyStatu_POINT   = 0x02
};


-(BOOL)isValidateNumb:(NSString *)numb;
-(BOOL)isValidateChar:(NSString *)string;
-(BOOL)isValidateName:(NSString *)name;
-(BOOL)isValidateThreePoint:(NSString *)data;
-(BOOL)isValidateEmail:(NSString *)email;
-(BOOL)isValidatePhone:(NSString *)phone;

/** 判断数据的键值是否合法 */
-(LCQKeyStatu)inputDataAndSaveIn:(NSString**)data andJudge:(LCQKeyChoose)numbchar;

@end
