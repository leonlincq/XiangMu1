//
//  Manageuserdatas.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Manageuserdatas.h"

@implementation Manageuserdatas

- (NSString *)description
{
    return [NSString stringWithFormat:@"用户名 : %@,密码 : %@,EMAIL : %@,电话号码 : %@,会员 : %@,密保问题1 : %@,密保答案1 : %@,密保问题2 : %@,密保答案3 %@,密保问题3 : %@,密保答案3 %@",_name,_password,_email,_phonenum,_member,@QUESTION_FRIST,_answer1,@QUESTION_SECON,_answer2,@QUESTION_THREE,_answer3];
}


@end
