//
//  Ui.h
//  项目1
//
//  Created by Leonlincq on 16/8/10.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Status.h"
#import "Status+Regex.h"

@interface Ui : Status


#define NAMEMIN     6
#define NAMEMAX     30

#define PASSWORDMIN 6
#define PASSWORDMAX 30

#define  PAYWORDLENGTH 6

typedef NSUInteger LCQKeyRule;
enum
{
    LCQKeyRule_NoRule   = 0x00,
    
    LCQKeyRule_Name     = 0x01,
    LCQKeyRule_PassWord = 0x02,
    LCQKeyRule_RealName = 0x03,
    LCQKeyRule_Email    = 0x04,
    LCQKeyRule_Phonenum = 0x05,
    LCQKeyRule_Member   = 0x06,
    LCQKeyRule_Question = 0x07,
    LCQKeyRule_Answer1  = 0x08,
    LCQKeyRule_Answer2  = 0x09,
    LCQKeyRule_Answer3  = 0x0A,

    
    LCQKeyRule_Numb     = 0x0B,
    LCQKeyRule_TestCode = 0x0C,
    LCQKeyRule_Admin    = 0x0D,
    
    LCQKeyRule_YesOrNo  = 0x0E,
    LCQKeyRule_Yes      = 0x0F,
    LCQKeyRule_No       = 0x10,
    
    LCQKeyRule_Money    = 0x11,
    LCQKeyRule_PayWord  = 0x12,
    LCQKeyRule_Address  = 0x13,
    
    
    LCQKeyRule_WareName         = 0x14,     //仅查找商品名
    LCQKeyRule_UpWareName       = 0x15,     //查找上架商品名
    LCQKeyRule_UpWareNameVague  = 0x16,     //模糊查找上架商品名
    
    LCQKeyRule_ABand1_6         = 0x17
    
};


typedef NSUInteger LCQResultKeyRule;
enum
{
    LCQResultKeyRule_Found          = 0x00, //找到数据
    LCQResultKeyRule_IllegalRule    = 0x01, //非法规则
    LCQResultKeyRule_IllegalLength  = 0x02, //非法长度
    LCQResultKeyRule_ThreePoint     = 0x03, //三个点
    LCQResultKeyRule_NoFound        = 0x04, //没不到
    LCQResultKeyRule_OpenFilefail   = 0x05, //打开文件失败
    LCQResultKeyRule_OK             = 0x06, //可以
    LCQResultKeyRule_Nil            = 0xFF  //无
};

/** 输入用户名并查找，找到并返回 */
-(LCQResultKeyRule)seekRule:(LCQKeyRule)rule AndJudgeSaveUser:(Manageuserdatas**)user;
/** 返回上一级界面 */
-(void)uiReturnUpUi:(LCQSTATUS)statu;
/** 错误提示界面 */
-(void)uiError;

@end
