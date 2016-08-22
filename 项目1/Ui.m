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
//      判断输入的字符键值是否符合规定
//==========================
-(LCQResultKeyRule)seekRule:(LCQKeyRule)rule AndJudgeSaveUser:(Manageuserdatas**)user
{
    Status *MyStatuP                = [Status statusShallOneData];
    
    Manageuserdatas *temp_user      = [[Manageuserdatas alloc]init];
    Operateuserdatas *temp_op       = [[Operateuserdatas alloc]init];
    
    NSString *temp_data             = [[NSString alloc]init];
    NSMutableArray *temp_alluser    = [[NSMutableArray alloc]init];
    
    LCQKeyStatu temp_keystatu;
    
    Operatewares *temp_wareop       = [[Operatewares alloc]init];
    
    
    
    switch (rule)
    {
        case LCQKeyRule_NoRule:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_allKeyValue];
            break;
            
        case LCQKeyRule_Name:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyNumbCharCross];
            break;
            
        case LCQKeyRule_PassWord:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_allKeyValue];
            break;
            
        case LCQKeyRule_RealName:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyChar];
            break;
            
        case LCQKeyRule_Email:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyEmail];
            break;

        case LCQKeyRule_Phonenum:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyPhoneNumb];
            break;
            
        case LCQKeyRule_Member:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyNumb];
            break;
        
        case LCQKeyRule_Answer1:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_allKeyValue];
            break;

        case LCQKeyRule_Answer2:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_allKeyValue];
            break;
            
        case LCQKeyRule_Answer3:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_allKeyValue];
            break;
        
        case LCQKeyRule_Numb:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyNumb];
            break;
            
        case LCQKeyRule_TestCode:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyAdmin];
            break;
            
        case LCQKeyRule_Admin:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyAdmin];
            break;
            
        case LCQKeyRule_YesOrNo:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyYesOrNo];
            break;
            
        case LCQKeyRule_Yes:
             temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyYes];
            break;
            
        case LCQKeyRule_No:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyNo];
            break;
            
        case LCQKeyRule_PayWord:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyNumb];
            break;
            
        case LCQKeyRule_Address:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyNumbChar];
            break;
            
        case LCQKeyRule_Money:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyNumb];
            break;
            
        case LCQKeyRule_WareName:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyNumbChar];
            break;
            
        case LCQKeyRule_UpWareName:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyNumbChar];
            break;
            
        case LCQKeyRule_UpWareNameVague:
            temp_keystatu = [super inputDataAndSaveIn:&temp_data andJudge:LCQKeyChoose_onlyNumbChar];
            break;
            
        default:
            break;
    }

    //3个点返回一定要先判断，优先级
    if(temp_keystatu == LCQKeyStatu_POINT)      //是3个点
    {
        [MyStatuP StatuChange:MyStatuP.StaNow & CHOOSE_UI ];
        return LCQResultKeyRule_ThreePoint;
    }
    
    if (temp_keystatu == LCQKeyStatu_NO)        //按键值不符合正则表达式
    {
        if (rule == LCQKeyRule_TestCode)
        {
            printf("%s",ERROR0x06_ILLEGAL_TEST);
        }
        else if (rule == LCQKeyRule_Admin)
        {
            printf("%s",ERROR0x08_ILLEGAL_ADMIN);            
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
            case LCQKeyRule_NoRule:
                return LCQResultKeyRule_OK;
                
            case LCQKeyRule_Name:
                if ( temp_data.length >=NAMEMIN && temp_data.length <=NAMEMAX )        //对用户名再进行限制
                {
                    if ([temp_op selectUser:temp_data andSaveArray:&temp_alluser] == FILEYES )
                    {
                        if(temp_alluser.count != 0)
                        {
                            temp_user = [temp_alluser[0] copy];
                            *user = temp_user;
                            return LCQResultKeyRule_Found;
                        }
                        else
                        {
                            temp_user.name = temp_data;
                            *user = temp_user;
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
                    temp_user.password = temp_data;
                    *user = temp_user;
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
                    temp_user.realname = temp_data;
                    *user = temp_user;
                    return LCQResultKeyRule_OK;
                }
                else
                {
                    printf("%s",ERROR0x03_ILLEGAL_LENGTH);
                    return LCQResultKeyRule_IllegalLength;
                }
                break;
                
            case LCQKeyRule_Email:
                temp_user.email = temp_data;
                *user = temp_user;
                return LCQResultKeyRule_OK;
                
            case LCQKeyRule_Phonenum:
                temp_user.phonenum = temp_data;
                *user = temp_user;
                return LCQResultKeyRule_OK;
                
            case LCQKeyRule_Member:
                temp_user.member = temp_data;
                *user = temp_user;
                return LCQResultKeyRule_OK;
                
                
            case LCQKeyRule_Answer1:
                temp_user.answer1 = temp_data;
                *user = temp_user;
                return LCQResultKeyRule_OK;
                
            case LCQKeyRule_Answer2:
                temp_user.answer2 = temp_data;
                *user = temp_user;
                return LCQResultKeyRule_OK;
                
            case LCQKeyRule_Answer3:
                temp_user.answer3 = temp_data;
                *user = temp_user;
                return LCQResultKeyRule_OK;
                
            case LCQKeyRule_Money:
                temp_user.money = [temp_data integerValue];
                *user = temp_user;
                return LCQResultKeyRule_OK;
                
            case LCQKeyRule_Numb:       //暂时用“会员”来装按键数值，长度回去再判断
                temp_user.member = temp_data;
                *user = temp_user;
                return LCQResultKeyRule_OK;
        
            case LCQKeyRule_TestCode:
                return LCQResultKeyRule_OK;
                
            case LCQKeyRule_Admin:
                return LCQResultKeyRule_OK;
 
            case LCQKeyRule_YesOrNo:       //暂时用“会员”来装按键数值，回去再判断
                temp_user.member = temp_data;
                *user = temp_user;
                return LCQResultKeyRule_OK;
    
            case LCQKeyRule_Yes:
                return LCQResultKeyRule_OK;
                
            case LCQKeyRule_No:
                return LCQResultKeyRule_OK;
            
            case LCQKeyRule_PayWord:
                if ( temp_data.length == PAYWORDLENGTH)        //对密码再进行限制
                {
                    temp_user.payword = temp_data;
                    *user = temp_user;
                    return LCQResultKeyRule_OK;
                }
                else
                {
                    printf("%s",ERROR0x0B_ILLEGAL_PAYLENGTH);
                    return LCQResultKeyRule_IllegalLength;
                }
                break;
                
                
            case LCQKeyRule_Address:
                temp_user.address = temp_data;
                *user = temp_user;
                return LCQResultKeyRule_OK;
                
                
            case LCQKeyRule_WareName:
                if ([temp_wareop selectWareByWho:nil andFlag:nil andWare:temp_data andClass:nil andSaveArray:&temp_alluser] == FILEYES )
                {
                    if(temp_alluser.count != 0)
                    {
                        temp_user.member = temp_data;
                        *user = temp_user;
                        return LCQResultKeyRule_Found;
                    }
                    else
                    {
                        temp_user.member = temp_data;
                        *user = temp_user;
                        return LCQResultKeyRule_NoFound;
                    }
                }
                else
                {
                    printf("%s",ERROR0xFE_FILE_OPNE_ERROR);
                    return LCQResultKeyRule_OpenFilefail;
                }
                break;
                
            case LCQKeyRule_UpWareName:
                if ([temp_wareop selectWareByWho:nil andFlag:UpWare andWare:temp_data andClass:nil andSaveArray:&temp_alluser] == FILEYES )
                {
                    if(temp_alluser.count != 0)
                    {
                        temp_user.member = temp_data;
                        *user = temp_user;
                        return LCQResultKeyRule_Found;
                    }
                    else
                    {
                        temp_user.member = temp_data;
                        *user = temp_user;
                        return LCQResultKeyRule_NoFound;
                    }
                }
                else
                {
                    printf("%s",ERROR0xFE_FILE_OPNE_ERROR);
                    return LCQResultKeyRule_OpenFilefail;
                }
                break;
                
            case LCQKeyRule_UpWareNameVague:
                if ([temp_wareop vagueSearchWare:temp_data andSaveArray:&temp_alluser] == FILEYES )
                {
                    if(temp_alluser.count != 0)
                    {
                        temp_user.member = temp_data;
                        *user = temp_user;
                        return LCQResultKeyRule_Found;
                    }
                    else
                    {
                        temp_user.member = temp_data;
                        *user = temp_user;
                        return LCQResultKeyRule_NoFound;
                    }
                }
                else
                {
                    printf("%s",ERROR0xFE_FILE_OPNE_ERROR);
                    return LCQResultKeyRule_OpenFilefail;
                }
                break;
                
                
                
            default:
                break;
        }
        
    }
    return LCQResultKeyRule_Nil;
}

//==========================
//      返回界面
//==========================
-(void)uiReturnUpUi:(LCQSTATUS)statu
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = 0;
    
    
    printf("=========================================\n");
    switch (statu)
    {
        case (MainInterface | M_home):
            printf("🔙请输入任意键返回主界面🔙\n");
            break;
            
        case (SuperUser | S_home):
            printf("🔙请输入任意键返回超级用户界面🔙\n");
            break;
            
        case (CommonUser | C_home):
            printf("🔙请输入任意键返回普通用户界面🔙\n");
            break;
            
        default:
            break;
    }
    printf("=========================================\n");
    
    
    temp_namestatu = [self seekRule:LCQKeyRule_NoRule AndJudgeSaveUser:&olduserdata];
//    if (temp_namestatu == LCQResultKeyRule_OK || temp_namestatu == LCQResultKeyRule_ThreePoint)
//    {
        [MyStatuP StatuChange:statu];
//    }
    printf("======================================\n");
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
