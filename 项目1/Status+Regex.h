//
//  Status+Regex.h
//  项目1
//
//  Created by etcxm on 16/8/12.
//  Copyright © 2016年 etc. All rights reserved.
//

#import "Status.h"

@interface Status (Regex)

#define NAMEMIN     6
#define NAMEMAX     30

#define PASSWORDMIN 6
#define PASSWORDMAX 30

typedef unsigned int LCQKeyChoose;  //键盘按键范围
enum
{
    onlyNumb            = 0x00,         //只能是数字
    onlyNumbCharCross   = 0x01,         //只能是用户名（数字、字母、下划线）
    onlyEmailValue      = 0x02,         //只能是邮箱名
    onlyEmailOrSpace    = 0x03,         //只能是邮箱名或者空格键
    onlyPhoneNumb       = 0x04,         //只能是手机号码
    onlyPhoneOrSpace    = 0x05,         //只能是手机号码或者空格键
    allKeyValue         = 0xFF          //可以是任意按键值
};

typedef BOOL LCQSpace;
enum
{
    noSpace     = 0x00,
    oneSpace    = 0x01
};


-(BOOL)isValidateNumb:(NSString *)numb;
-(BOOL)isValidateName:(NSString *)name;
-(BOOL)isValidateOneSpace:(NSString *)data;
-(BOOL)isValidateEmail:(NSString *)email;
-(BOOL)isValidatePhone:(NSString *)phone;

/** 判断数据的键值是否合法 */
-(BOOL)inputDataAndSaveIn:(NSString**)data andJudge:(LCQKeyChoose)numbchar;

@end
