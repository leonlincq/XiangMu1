//
//  Ui.m
//  项目1
//
//  Created by Leonlincq on 16/8/10.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Ui.h"

@implementation Ui

//==========================
//      判断输入的用户名
//==========================
-(LCQResultKeyRule)seekRule:(LCQKeyRule)rule AndJudgeSaveUser:(Manageuserdatas**)user
{
    Manageuserdatas *temp_user      = [[Manageuserdatas alloc]init];
    Operateuserdatas *temp_op       = [[Operateuserdatas alloc]init];
    NSString *temp_data             = [[NSString alloc]init];
    NSMutableArray *temp_alluser    = [[NSMutableArray alloc]init];
    
    LCQKeyStatu temp_keystatu;
    
    switch (rule)
    {
        case LCQKeyRule_Name:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:onlyNumbCharCross];
            break;
            
        case LCQKeyRule_PassWord:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:allKeyValue];            
            break;
            
        case LCQKeyRule_RealName:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:onlyChar];
            break;
            
        case LCQKeyRule_Email:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:onlyEmail];
            break;

        case LCQKeyRule_Phonenum:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:onlyPhoneNumb];
            break;
        
        case LCQKeyRule_Answer1:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:allKeyValue];
            break;

        case LCQKeyRule_Answer2:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:allKeyValue];
            break;
            
        case LCQKeyRule_Answer3:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:allKeyValue];
            break;
        
        case LCQKeyRule_Numb:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:onlyNumb];
            break;
            
        case LCQKeyRule_TestCode:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:onlyadmin];
            break;

            
            
        default:
            break;
    }

    
    //3个点返回一定要先判断，优先级
    if(temp_keystatu == LCQKeyStatu_POINT)      //是3个点
    {
        return LCQResultKeyRule_ThreePoint;
    }
    
    if (temp_keystatu == LCQKeyStatu_NO)        //按键值不符合正则表达式
    {
        if (rule == LCQKeyRule_TestCode)
        {
            printf("%s",ERROR0x06_ILLEGAL_ADMIN);
        }
        else
        {
            printf("%s",ERROR0x02_ILLEGAL_RULE);
        }
        return LCQResultKeyRule_IllegalRule;
    }
    
    if(temp_keystatu == LCQKeyStatu_YES)       //按键值符合正则表达式
    {
        switch (rule)
        {
            case LCQKeyRule_Name:
                if ( temp_data.length >=NAMEMIN && temp_data.length <=NAMEMAX )        //对用户名再进行限制
                {
                    if ([temp_op selectUser:temp_data andSaveArray:&temp_alluser] == FILEYES )
                    {
                        if(temp_alluser.count != 0)
                        {
                            temp_user = [temp_alluser copy];
                            *user = temp_user;
                            return LCQResultKeyRule_Found;
                        }
                        else
                            
                        {
                            (*user).name = temp_data;
                            return LCQResultKeyRule_NoFound;
                        }
                    }
                    else
                    {
                        printf("%s",ERROR0xFE_FILE_OPNE_ERROR);
                        return LCQResultKeyRule_OpenFilefail;
                    }
                }
                else
                {
                    printf("%s",ERROR0x03_ILLEGAL_LENGTH);
                    return LCQResultKeyRule_IllegalLength;
                }
                break;
                
            case LCQKeyRule_PassWord:
                if ( temp_data.length >=PASSWORDMIN && temp_data.length <=PASSWORDMAX )        //对密码再进行限制
                {
                    (*user).password = temp_data;
                    return LCQResultKeyRule_OK;
                }
                else
                {
                    printf("%s",ERROR0x03_ILLEGAL_LENGTH);
                    return LCQResultKeyRule_IllegalLength;
                }
                break;
                
            case LCQKeyRule_RealName:
                if ( temp_data.length >=NAMEMIN && temp_data.length <=NAMEMAX )        //对真名再进行限制
                {
                    (*user).realname = temp_data;
                    return LCQResultKeyRule_OK;
                }
                else
                {
                    printf("%s",ERROR0x03_ILLEGAL_LENGTH);
                    return LCQResultKeyRule_IllegalLength;
                }
                break;
                
            case LCQKeyRule_Email:
                (*user).email = temp_data;
                return LCQResultKeyRule_OK;
                
            case LCQKeyRule_Phonenum:
                (*user).phonenum = temp_data;
                return LCQResultKeyRule_OK;
                
            case LCQKeyRule_Answer1:
                (*user).answer1 = temp_data;
                return LCQResultKeyRule_OK;
                
            case LCQKeyRule_Answer2:
                (*user).answer2 = temp_data;
                return LCQResultKeyRule_OK;
                
            case LCQKeyRule_Answer3:
                (*user).answer3 = temp_data;
                return LCQResultKeyRule_OK;
                
            case LCQKeyRule_Numb:       //暂时用“会员”来装按键数值，长度回去再判断
                (*user).member = temp_data;
                return LCQResultKeyRule_OK;
        
            case LCQKeyRule_TestCode:
                return LCQResultKeyRule_OK;
                
            default:
                break;
        }
        
    }
    return LCQResultKeyRule_Nil;
}


//==========================
//      错误界面
//==========================
-(void)uiError
{
    NSLog(@"=========================");
    NSLog(@"*     异常状态,请重启      *");
    NSLog(@"=========================");
    [super lookStatu];
    while (1);
}

@end
