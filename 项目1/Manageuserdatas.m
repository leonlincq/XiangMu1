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
    if (printfdata == nil)
    {
        printf("用户名：(没填)");
    }
    else
    {
        printf("用户名：%s",printfdata);
    }
}

-(void)printfRealName
{
    const char *printfdata;
    printfdata = [self.realname UTF8String];
    if (printfdata == nil)
    {
        printf("真名：(没填)");
    }
    else
    {
        printf("真名：%s",printfdata);
    }
}

-(void)printfPassword
{
    const char *printfdata;
    printfdata = [self.password UTF8String];
    if (printfdata == nil)
    {
        printf("密码：(没填)");
    }
    else
    {
        printf("密码：%s",printfdata);
    }
}

-(void)printfEmail
{
    const char *printfdata;
    printfdata = [self.email UTF8String];
    if (printfdata == nil)
    {
        printf("Email：(没填)");
    }
    else
    {
        printf("Email：%s",printfdata);
    }
}


-(void)printfPhonenum
{
    const char *printfdata;
    printfdata = [self.phonenum UTF8String];
    if (printfdata == nil)
    {
        printf("电话：(没填)");
    }
    else
    {
        printf("电话：%s",printfdata);
    }
}

-(void)printfMember
{
    const char *printfdata;
    printfdata = [self.member UTF8String];
    if (printfdata == nil)
    {
        printf("会员：(没填)");
    }
    else
    {
        printf("会员：%s",printfdata);
    }
}

-(void)printfQuestion1
{
    const char *printfdata;
    printfdata = [self.question1 UTF8String];
    if (printfdata == nil)
    {
        printf("密保1问题：(没填)");
    }
    else
    {
        printf("密保1问题：%s",printfdata);
    }
}

-(void)printfAnswer1
{
    const char *printfdata;
    printfdata = [self.answer1 UTF8String];
    if (printfdata == nil)
    {
        printf("密保1答案：(没填)");
    }
    else
    {
        printf("密保1答案：%s",printfdata);
    }
}

-(void)printfQuestion2
{
    const char *printfdata;
    printfdata = [self.question2 UTF8String];
    if (printfdata == nil)
    {
        printf("密保2问题：(没填)");
    }
    else
    {
        printf("密保2问题：%s",printfdata);
    }
}

-(void)printfAnswer2
{
    const char *printfdata;
    printfdata = [self.answer2 UTF8String];
    if (printfdata == nil)
    {
        printf("密保2答案：(没填)");
    }
    else
    {
        printf("密保2答案：%s",printfdata);
    }
}

-(void)printfQuestion3
{
    const char *printfdata;
    printfdata = [self.question3 UTF8String];
    if (printfdata == nil)
    {
        printf("密保3问题：(没填)");
    }
    else
    {
        printf("密保3问题：%s",printfdata);
    }
}

-(void)printfAnswer3
{
    const char *printfdata;
    printfdata = [self.answer3 UTF8String];
    if (printfdata == nil)
    {
        printf("密保3答案：(没填)");
    }
    else
    {
        printf("密保3答案：%s",printfdata);
    }
}

-(void)printfPayword
{
    const char *printfdata;
    printfdata = [self.payword UTF8String];
    if (printfdata == nil)
    {
        printf("支付密码：(没填)");
    }
    else
    {
        printf("支付密码：%s",printfdata);
    }
}

-(void)printfAddress
{
    const char *printfdata;
    printfdata = [self.address UTF8String];
    if (printfdata == nil)
    {
        printf("收货地址：(没填)");
    }
    else
    {
        printf("收货地址：%s",printfdata);
    }
}

-(void)printfMoney
{
    if (self.money == 0)
    {
        printf("金额：0");
    }
    else
    {
        printf("金额：%ld",self.money);
    }
}

-(void)printfAllData
{
    printf("0️⃣");
    [self printfName];
    printf(" ,");
    
    printf("1️⃣");
    [self printfPassword];
    printf(" ,");
    
    printf("2️⃣");
    [self printfRealName];
    printf(" ,");
    
    printf("3️⃣");
    [self printfEmail];
    printf(" ,");
    
    printf("4️⃣");
    [self printfPhonenum];
    printf(" ,");
    
    printf("5️⃣");
    [self printfMember];
    printf(" ,");
    
    printf("6️⃣");
    [self printfQuestion1];
    printf(" ,");
    
    printf("7️⃣");
    [self printfAnswer1];
    printf(" ,");
    
    printf("8️⃣");
    [self printfQuestion2];
    printf(" ,");
    
    printf("9️⃣");
    [self printfAnswer2];
    printf(" ,");
    
    printf("1️⃣0️⃣");
    [self printfQuestion3];
    printf(" ,");
    
    printf("1️⃣1️⃣");
    [self printfAnswer3];
    printf(" ,");

    printf("1️⃣2️⃣");
    [self printfPayword];
    printf(" ,");
    
    printf("1️⃣3️⃣");
    [self printfAddress];
    printf(" ,");
    
    printf("1️⃣4️⃣");
    [self printfMoney];
    printf("\n");
}

-(void)printfAllAnswer
{
    printf("0️⃣");
    [self printfName];
    printf(" ,");
    
    printf("1️⃣");
    [self printfQuestion1];
    printf(" ,");
    
    printf("1️⃣");
    [self printfAnswer1];
    printf(" ,");

    printf("2️⃣");
    [self printfQuestion2];
    printf(" ,");
    
    printf("2️⃣");
    [self printfAnswer2];
    printf(" ,");

    printf("3️⃣");
    [self printfQuestion2];
    printf(" ,");
    
    printf("3️⃣");
    [self printfAnswer3];
    printf("\n");
}

- (id)copyWithZone:(nullable NSZone *)zone
{
    Manageuserdatas *newuser = [[Manageuserdatas alloc]init];
    
    newuser.name        = [_name mutableCopy];
    newuser.password    = [_password mutableCopy];
    newuser.realname    = [_realname mutableCopy];
    newuser.email       = [_email mutableCopy];
    newuser.phonenum    = [_phonenum mutableCopy];
    newuser.member      = [_member mutableCopy];
    newuser.question1   = [_question1 mutableCopy];
    newuser.answer1     = [_answer1 mutableCopy];
    newuser.question2   = [_question2 mutableCopy];
    newuser.answer2     = [_answer2 mutableCopy];
    newuser.question3   = [_question3 mutableCopy];
    newuser.answer3     = [_answer3 mutableCopy];
    newuser.payword     = [_payword mutableCopy];
    newuser.address     = [_address mutableCopy];
    newuser.money       = _money;
    
    return newuser;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_name      forKey:@"name"];
    [aCoder encodeObject:_password  forKey:@"password"];
    [aCoder encodeObject:_realname  forKey:@"realname"];
    [aCoder encodeObject:_email     forKey:@"email"];
    [aCoder encodeObject:_phonenum  forKey:@"phonenum"];
    [aCoder encodeObject:_member    forKey:@"member"];
    [aCoder encodeObject:_question1 forKey:@"question1"];
    [aCoder encodeObject:_answer1   forKey:@"answer1"];
    [aCoder encodeObject:_question2 forKey:@"question2"];
    [aCoder encodeObject:_answer2   forKey:@"answer2"];
    [aCoder encodeObject:_question3 forKey:@"question3"];
    [aCoder encodeObject:_answer3   forKey:@"answer3"];
    [aCoder encodeObject:_payword   forKey:@"payword"];
    [aCoder encodeObject:_address   forKey:@"address"];
    [aCoder encodeInteger:_money    forKey:@"money"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder;
{
    self = [super init];
    if (self)
    {
        self.name       = [aDecoder decodeObjectForKey:@"name"];
        self.password   = [aDecoder decodeObjectForKey:@"password"];
        self.realname   = [aDecoder decodeObjectForKey:@"realname"];
        self.email      = [aDecoder decodeObjectForKey:@"email"];
        self.phonenum   = [aDecoder decodeObjectForKey:@"phonenum"];
        self.member     = [aDecoder decodeObjectForKey:@"member"];
        self.question1  = [aDecoder decodeObjectForKey:@"question1"];
        self.answer1    = [aDecoder decodeObjectForKey:@"answer1"];
        self.question2  = [aDecoder decodeObjectForKey:@"question2"];
        self.answer2    = [aDecoder decodeObjectForKey:@"answer2"];
        self.question3  = [aDecoder decodeObjectForKey:@"question3"];
        self.answer3    = [aDecoder decodeObjectForKey:@"answer3"];
        self.payword    = [aDecoder decodeObjectForKey:@"payword"];
        self.address    = [aDecoder decodeObjectForKey:@"address"];
        self.money      = [aDecoder decodeIntegerForKey:@"money"];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"用户名:%@ ,密码:%@ ,真名:%@ ,EMAIL:%@ ,电话号码:%@ ,会员:%@ ,密保问题1:%@ ,密保答案1:%@ ,密保问题2:%@ ,密保答案2:%@ ,密保问题3:%@ ,密保答案3:%@ ,支付密码:%@ ,收货地址:%@ ,金额:%ld 。",_name,_password,_realname,_email,_phonenum,_member,@QUESTION_FRIST,_answer1,@QUESTION_SECON,_answer2,@QUESTION_THREE,_answer3,_payword,_address,_money];
}


@end
