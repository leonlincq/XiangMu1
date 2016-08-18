//
//  Status+Regex.m
//  项目1
//
//  Created by Leonlincq on 16/8/12.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Status+Regex.h"

@implementation Status (Regex)

//=====================================正则表达式start==================================
//  []          : 找到内部的某一个字符即可
//  |           : 匹配多个条件,相当于or\或
//  \\          : 转义字符，可以隔开特殊字符，如[，如果不加\\，会识别为找到[]内部的内容
//  .           : 省略符
//  ?           : 0个或者1个
//  +           : 至少1个     //常用
//  *           : 0个或者多个
//  ^           : 首位
//  $           : 末位

//  [a-zA-Z0-9] :a~z和A~z和0~9
//  \\d         : 数字
//  \\d{2,4}    : 2位-4位数字

//eg:   \\[.+\\]                表示 [.................] 括号以及括号内的内容
//      \\d{6,9}|\\d\\d\\d      位或6到9位数字
//      ^\\d{3}                 首位为数字且连续3个数字
//      \\d{3}$                 末位为数字且连续3个数字
//      ^\\d.*\\d$              首位为数字 .是省略*多个省略 末位也为数字


// 表情的规则
// NSString *emotionPattern = @"\\[[0-9a-zA-Z\\u4e00-\\u9fa5]+\\]";

// @的规则
// NSString *atPattern = @"@[0-9a-zA-Z\\u4e00-\\u9fa5]+";

// #话题#的规则
// NSString *topicPattern = @"#[0-9a-zA-Z\\u4e00-\\u9fa5]+#";

// url链接的规则
// NSString *urlPattern = @"\\b(([\\w-]+://?|www[.])[^\\s()<>]+(?:\\([\\w\\d]+\\)|([^[:punct:]\\s]|/)))";


//正则表达式--验证手机号码:13[0-9]{9}
//实现手机号前带86或是+86的情况:^((\+86)|(86))?(13)\d{9}$
//电话号码与手机号码同时验证:(^(\d{3,4}-)?\d{7,8})$|(13[0-9]{9})
//提取信息中的网络链接:(h|H)(r|R)(e|E)(f|F)  *=  *('|")?(\w|\\|\/|\.)+('|"|  *|>)?
//提取信息中的邮件地址:\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*
//提取信息中的图片链接:(s|S)(r|R)(c|C)  *=  *('|")?(\w|\\|\/|\.)+('|"|  *|>)?
//提取信息中的IP地址:(\d+)\.(\d+)\.(\d+)\.(\d+)
//提取信息中的中国手机号码:(86)*0*13\d{9}
//提取信息中的中国固定电话号码:(\(\d{3,4}\)|\d{3,4}-|\s)?\d{8}
//提取信息中的中国电话号码（包括移动和固定电话）:(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}
//提取信息中的中国邮政编码:[1-9]{1}(\d+){5}
//提取信息中的中国身份证号码:\d{18}|\d{15}
//提取信息中的整数：\d+
//提取信息中的浮点数（即小数）：(-?\d*)\.?\d+
//提取信息中的任何数字  ：(-?\d*)(\.\d+)?
//提取信息中的中文字符串：[\u4e00-\u9fa5]*
//提取信息中的双字节字符串  (汉字)：[^\x00-\xff]*

//=====================================正则表达式end==================================

//===========================================
//          判断输入数字的合法性
//===========================================
-(BOOL)isValidateNumb:(NSString *)numb
{
    NSString *numbRegex = @"\\d+";
    NSPredicate *numbTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numbRegex];
    return [numbTest evaluateWithObject:numb];
}

//===========================================
//          判断输入字母的合法性
//===========================================
-(BOOL)isValidateChar:(NSString *)string
{
    NSString *stringRegex = @"[a-zA-Z]+";
    NSPredicate *stringTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stringRegex];
    return [stringTest evaluateWithObject:string];
}

//===========================================
//          判断用户名的合法性
//===========================================
-(BOOL)isValidateName:(NSString *)name
{
    NSString *nameRegex = @"[a-zA-Z0-9_]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    return [nameTest evaluateWithObject:name];
}

//===========================================
//          判断是否3个句号
//===========================================
-(BOOL)isValidateThreePoint:(NSString *)data
{
    NSString *dataRegex = @"\\.{3}";
    NSPredicate *dataTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", dataRegex];
    return [dataTest evaluateWithObject:data];
}

//===========================================
//          判断是否3个逗号
//===========================================
-(BOOL)isValidateComma:(NSString *)data
{
    NSString *dataRegex = @"\\,{3}";
    NSPredicate *dataTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", dataRegex];
    return [dataTest evaluateWithObject:data];
}

//===========================================
//          判断是否admin
//===========================================
-(BOOL)isValidateAdmin:(NSString *)data
{
    NSString *dataRegex = @"admin";
    NSPredicate *dataTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", dataRegex];
    return [dataTest evaluateWithObject:data];
}

//===========================================
//          判断是否Yes或No
//===========================================
-(BOOL)isValidateYesOrNo:(NSString *)data
{
    NSString *dataRegex = @"[Yy][Ee][Ss]|[Nn][Oo]";
    NSPredicate *dataTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", dataRegex];
    return [dataTest evaluateWithObject:data];
}

//===========================================
//          判断是否Yes
//===========================================
-(BOOL)isValidateYes:(NSString *)data
{
    NSString *dataRegex = @"[Yy][Ee][Ss]";
    NSPredicate *dataTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", dataRegex];
    return [dataTest evaluateWithObject:data];
}

//===========================================
//          判断是否No
//===========================================
-(BOOL)isValidateNo:(NSString *)data
{
    NSString *dataRegex = @"[Nn][Oo]";
    NSPredicate *dataTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", dataRegex];
    return [dataTest evaluateWithObject:data];
}

//===========================================
//          判断邮箱地址的合法性
//
//  @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
//
//  [A-Z0-9a-z ._%+-]    +          @ [A-Za-z0-9  .-  ]  +          \\.  [A-Za-z]{2,4}
//   数字字母     符号 匹配1个或多个    @   数字字母   符号  匹配1个或多个   .     2-4位字母
//===========================================
-(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//===========================================
//          判断手机号码的合法性
//  @"\\d{4}-?\\d{8}|13[0-9]{9}"
//  \\d{4}  -       ?       \\d{8}  |   13  [0-9]{9}
//  4个号码  - 匹配0个或1个   8个号码  或者  13   9个号码
//===========================================
-(BOOL)isValidatePhone:(NSString *)phone
{
    NSString *phoneRegex = @"\\d{4}-?\\d{8}|13[0-9]{9}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}

//==========================
//      输入数据并判断
//==========================
-(LCQKeyStatu)inputDataAndSaveIn:(NSString**)data andJudge:(LCQKeyChoose)numbchar
{
    char opString[200];
    scanf("%s",opString);
    NSString *temp_data = [NSString stringWithFormat:@"%s",opString];
    
    if([self isValidateThreePoint:temp_data] == YES)
    {
        return LCQKeyStatu_POINT;
    }
    
    switch (numbchar)
    {
        case LCQKeyChoose_onlyNumb:
            if ([self isValidateNumb:temp_data] == NO)
            {
                return LCQKeyStatu_NO;
            }
            break;
            
        case LCQKeyChoose_onlyChar:
            if ([self isValidateChar:temp_data] == NO )
            {
                return LCQKeyStatu_NO;
            }
            break;
            
        case LCQKeyChoose_onlyNumbCharCross:
            if ([self isValidateName:temp_data] == NO)
            {
                return LCQKeyStatu_NO;
            }
            break;
            
        case LCQKeyChoose_onlyEmail:
            if ([self isValidateEmail:temp_data] == NO)
            {
                return LCQKeyStatu_NO;
            }
            break;
            
        case LCQKeyChoose_onlyPhoneNumb:
            if ([self isValidatePhone:temp_data] == NO)
            {
                return LCQKeyStatu_NO;
            }
            break;
            
        case LCQKeyChoose_onlyAdmin:
            if ([self isValidateAdmin:temp_data] == NO)
            {
                return LCQKeyStatu_NO;
            }
            break;
        
        case LCQKeyChoose_onlyYesOrNo:
            if ([self isValidateYesOrNo:temp_data] == NO)
            {
                return LCQKeyStatu_NO;
            }
            break;
            
            
        case LCQKeyChoose_onlyYes:
            if ([self isValidateYes:temp_data] == NO)
            {
                return LCQKeyStatu_NO;
            }
            break;
            
        case LCQKeyChoose_onlyNo:
            if ([self isValidateNo:temp_data] == NO)
            {
                return LCQKeyStatu_NO;
            }
            break;
            
            
        case LCQKeyChoose_allKeyValue:
        default:
            break;
    }

    *data = temp_data;
    
    return LCQKeyStatu_YES;
}

@end
