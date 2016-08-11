//
//  Manageuserdatas.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manageuserdatas : NSObject

//用户信息表

// 用户名 | 密码 | 邮件 | 电话 | 会员 | 密保问题1 | 密保答案1 | 密保问题2 | 密保答案2 | 密保问题3 | 密保答案3 |

@property (nonatomic,copy)      NSString    *name;      //用户名       --关联
@property (nonatomic,copy)      NSString    *password;  //密码
@property (nonatomic,copy)      NSString    *email;     //邮件
@property (nonatomic,copy)      NSString    *phonenum;  //电话
@property (nonatomic,copy)      NSString    *member;    //会员
@property (nonatomic,copy)      NSString    *question1; //密保问题1
@property (nonatomic,copy)      NSString    *answer1;   //密保答案1
@property (nonatomic,copy)      NSString    *question2; //密保问题2
@property (nonatomic,copy)      NSString    *answer2;   //密保答案2
@property (nonatomic,copy)      NSString    *question3; //密保问题3
@property (nonatomic,copy)      NSString    *answer3;   //密保答案3

@end
