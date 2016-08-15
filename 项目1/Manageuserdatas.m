//
//  Manageuserdatas.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Manageuserdatas.h"

@implementation Manageuserdatas

-(void)printfName
{
    const char *printfdata;
    printfdata = [self.name UTF8String];
    printf("用户名：%s",printfdata);
}

-(void)printfRealName
{
    const char *printfdata;
    printfdata = [self.realname UTF8String];
    printf("真名：%s",printfdata);
}

-(void)printfPassword
{
    const char *printfdata;
    printfdata = [self.password UTF8String];
    printf("密码：%s",printfdata);
}

-(void)printfEmail
{
    const char *printfdata;
    printfdata = [self.email UTF8String];
    printf("Email：%s",printfdata);
}


-(void)printfPhonenum
{
    const char *printfdata;
    printfdata = [self.phonenum UTF8String];
    printf("电话：%s",printfdata);
}

-(void)printfMember
{
    const char *printfdata;
    printfdata = [self.member UTF8String];
    printf("会员：%s",printfdata);
}

-(void)printfQuestion1
{
    const char *printfdata;
    printfdata = [self.question1 UTF8String];
    printf("密保1问题：%s",printfdata);
}

-(void)printfAnswer1
{
    const char *printfdata;
    printfdata = [self.answer1 UTF8String];
    printf("密保1答案：%s",printfdata);
}

-(void)printfQuestion2
{
    const char *printfdata;
    printfdata = [self.question2 UTF8String];
    printf("密保2问题：%s",printfdata);
}

-(void)printfAnswer2
{
    const char *printfdata;
    printfdata = [self.answer1 UTF8String];
    printf("密保2答案：%s",printfdata);
}

-(void)printfQuestion3
{
    const char *printfdata;
    printfdata = [self.question3 UTF8String];
    printf("密保3问题：%s",printfdata);
}

-(void)printfAnswer3
{
    const char *printfdata;
    printfdata = [self.answer3 UTF8String];
    printf("密保3答案：%s",printfdata);
}

-(void)printfAllData
{
    [self printfName];
    printf(" ,");
    [self printfPassword];
    printf(" ,");
    [self printfRealName];
    printf(" ,");
    [self printfEmail];
    printf(" ,");
    [self printfPhonenum];
    printf(" ,");
    [self printfMember];
    printf(" ,");
    [self printfQuestion1];
    printf(" ,");
    [self printfAnswer1];
    printf(" ,");
    [self printfQuestion2];
    printf(" ,");
    [self printfAnswer2];
    printf(" ,");
    [self printfQuestion3];
    printf(" ,");
    [self printfAnswer3];
    printf("\n");
}

- (id)copyWithZone:(nullable NSZone *)zone
{
    Manageuserdatas *newuser = [[Manageuserdatas alloc]init];
    
    newuser.name        = [_name mutableCopy];
    newuser.password    = [_password mutableCopy];
    newuser.email       = [_email mutableCopy];
    newuser.phonenum    = [_phonenum mutableCopy];
    newuser.member      = [_member mutableCopy];
    newuser.question1   = [_question1 mutableCopy];
    newuser.answer1     = [_answer1 mutableCopy];
    newuser.question2   = [_question2 mutableCopy];
    newuser.answer2     = [_answer2 mutableCopy];
    newuser.question3   = [_question3 mutableCopy];
    newuser.answer3     = [_answer3 mutableCopy];

    return newuser;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"用户名:%@ ,密码:%@ ,EMAIL:%@ ,电话号码:%@ ,会员:%@ ,密保问题1:%@ ,密保答案1:%@ ,密保问题2:%@ ,密保答案2:%@ ,密保问题3:%@ ,密保答案3:%@。",_name,_password,_email,_phonenum,_member,@QUESTION_FRIST,_answer1,@QUESTION_SECON,_answer2,@QUESTION_THREE,_answer3];
}


@end
