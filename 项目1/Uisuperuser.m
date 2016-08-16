//
//  Uisuperuser.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Uisuperuser.h"

@implementation Uisuperuser

-(instancetype)initWithTimer
{
    self = [super init];
    if (self)
    {
        _myTick = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(oneSecTick:) userInfo:nil repeats:YES];
        [_myTick setFireDate:[NSDate distantFuture]];
        _countByTimer = ReturuSperUserTime;
    }
    return self;
}

//==========================
//      定时器控制
//==========================
-(void)oneSecTick:(NSTimer*)temptimer
{
    _countByTimer--;
    printf("%ld秒后返回超级用户界面...\n",_countByTimer);
    
    if(_countByTimer == 0)
    {
        [_myTick setFireDate:[NSDate distantFuture]];
        Status *MyStatuP = [Status statusShallOneData];
        [MyStatuP StatuChange:(SuperUser | S_home)];
    }
}

//==========================
//      进入等待定时器
//==========================
-(void)enterWaitTimer
{
    Status *MyStatuP = [Status statusShallOneData];      //更改主方法状态
    
    [MyStatuP StatuChange:WaitTimer];
    _countByTimer = ReturuSperUserTime;
    [_myTick setFireDate:[NSDate distantPast]];
}

//==========================
//      超级用户接口
//==========================
-(void)uiSuperUserInterface
{
    Status *MyStatuP = [Status statusShallOneData];
    
    switch (MyStatuP.StaNow)
    {
        case (SuperUser | S_home):              //超级用户界面首页
            [self uiSuperUserHome];
            break;
            
        case (SuperUser | S_seekUserData):      //查看用户信息
            [self uiSuperUserSeekUserData];
            break;
            
        case (SuperUser | S_upUserData):        //修改用户信息
            [self uiSuperUserUpUserData];
            break;
            
        case (SuperUser | S_deleUserData):      //删除用户信息
            [self uiSuperUserDeleUserData];
            break;
            
        case (SuperUser | S_operaUserMoney):    //用户资金操作
            [self uiSuperUserOperaUserMoney];
            break;
            
        case (SuperUser | S_operaWares):        //商品操作
            [self uiSuperUserOperaWares];
            break;
            
        case (SuperUser | S_operaOrder):        //订单操作
            [self uiSuperUserOperaOrder];
            break;
            
        case (SuperUser | S_addUser):           //添加用户
            [self uiSuperUserAddUser];
            break;
            
        case (SuperUser | S_cleProPassWord):    //密保库清0
            [self uiSuperUserCleProPassWord];
            break;
            
        case (SuperUser | S_clemoneyhistory):   //资金历史记录清除
            [self uiSuperUserClemoneyhistory];
            break;
            
        case (SuperUser | S_seekProPassWord):   //查看用户密保
            [self uiSuperUserSeekProPassWord];
            break;
            
            
        //不应该出现的状态
        case (SuperUser | S_returnMain):        //返回主界面（登录界面）
        default:
            [super uiError];
            break;
    }
}


//==========================
//      超级用户界面
//==========================
-(void)uiSuperUserHome
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
    
    printf("         🌳     管理员     🌳         \n");
    printf("======================================\n");
    printf("*           🐴1.查看用户信息           *\n");
    printf("*           🐑2.修改用户名字           *\n");
    printf("*           🐧3.删除用户信息           *\n");
    printf("*           🐶4.用户资金操作           *\n");
    printf("*           🐘5.商品操作               *\n");
    printf("*           🐤6.订单操作               *\n");
    printf("*           🐔7.添加用户               *\n");
    printf("*           🐹8.密保库清0              *\n");
    printf("*           🐼9.历史资金清除           *\n");
    printf("*           🐬10.查看用户密保          *\n");
    printf("*           🐠11.返回登录界面          *\n");
    printf("======================================\n");
    
    while (1)
    {
        printf("▶️请输入操作序号(1-11):");
        temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
        if (temp_namestatu == LCQResultKeyRule_OK)
        {
            int tempjudge = [olduserdata.member intValue];
            switch ( tempjudge )
            {
                case S_seekUserData:
                    [MyStatuP StatuChange:(SuperUser | tempjudge)];     //超级用户界面+查看用户信息
                    return;
                        
                case S_upUserData:
                    [MyStatuP StatuChange:(SuperUser | tempjudge)];     //超级用户界面+修改用户信息
                    return;
                        
                case S_deleUserData:
                    [MyStatuP StatuChange:(SuperUser | tempjudge)];     //超级用户界面+删除用户信息
                    return;
                        
                case S_operaUserMoney:
                    [MyStatuP StatuChange:(SuperUser | tempjudge)];     //超级用户界面+用户资金操作
                    return;
                    
                case S_operaWares:
                    [MyStatuP StatuChange:(SuperUser | tempjudge)];     //超级用户界面+商品操作
                    return;
                    
                case S_operaOrder:
                    [MyStatuP StatuChange:(SuperUser | tempjudge)];     //超级用户界面+订单操作
                    return;
                    
                case S_addUser:
                    [MyStatuP StatuChange:(SuperUser | tempjudge)];     //超级用户界面+添加用户
                    return;
                    
                case S_cleProPassWord:
                    [MyStatuP StatuChange:(SuperUser | tempjudge)];     //超级用户界面+密保库清0
                    return;
                    
                case S_clemoneyhistory:
                    [MyStatuP StatuChange:(SuperUser | tempjudge)];     //超级用户界面+资金历史记录清除
                    return;
                    
                case S_seekProPassWord:
                    [MyStatuP StatuChange:(SuperUser | tempjudge)];     //超级用户界面+查看用户密保
                    return;
                    
                case S_returnMain:
                    [MyStatuP StatuChange:(MainInterface | M_home)];     //返回主界面（登录界面）
                    return;
                        
                default:
                    printf("%s",ERROR0x01_ILLEGAL_NUM);
                    break;
            }//判断数字
        }
    }//结束while
}

//==========================
//     Ui超级用户界面功能升级中
//==========================
-(void)uiSuperUserUping
{
    Status *MyStatuP = [Status statusShallOneData];
    
    printf("升级ing...\n");
    [MyStatuP StatuChange:(SuperUser | S_home)];
}

//==========================
//      查看用户信息
//==========================
-(void)uiSuperUserSeekUserData
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *newuser        = [[Manageuserdatas alloc]init];    //要保存的实例
    Operateuserdatas *newop         = [[Operateuserdatas alloc]init];   //文件操作
    uisuper_Seek tempstatu          = uisuper_Seek_makechoose;          //该方法的状态
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
    NSMutableArray *tempuser        = [[NSMutableArray alloc]init];     //保存的数组

    printf("=========================================\n");

    while(1)
    {
        switch (tempstatu)
        {
            case uisuper_Seek_makechoose:
                printf("▶️1.查看所有用户 2.查看单个用户(🔙可输入'...'取消查看🔙)：");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    int tempjudge = [olduserdata.member intValue];
                    switch (tempjudge)
                    {
                        case uisuper_Seek_chooseall:
                            tempstatu = uisuper_Seek_chooseall;
                            printf("=========================================\n");
                            break;
                            
                        case uisuper_Seek_chooseone:
                            tempstatu = uisuper_Seek_chooseone;
                            printf("=========================================\n");
                            break;
                        default:
                            printf("%s",ERROR0x01_ILLEGAL_NUM);
                            break;
                    }
                }
                break;
                
            case uisuper_Seek_chooseall:
                [newop selectUser:nil andSaveArray:&tempuser];
                for (int i =0; i<tempuser.count; i++)
                {
                    newuser = [tempuser[i] copy];
                    [newuser printfAllData];
                }
                [self uiReturnUpUi:(SuperUser | S_home)];
                return;
                
            case uisuper_Seek_chooseone:
                printf("▶️请输入要查看的用户名(🔙可输入'...'取消查看🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Name AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_Found)
                {
                    newuser = [olduserdata copy];
                    [newuser printfAllData];
                    [self uiReturnUpUi:(SuperUser | S_home)];
                    return;
                }
                else if(temp_namestatu == LCQResultKeyRule_NoFound)
                {
                    printf("%s",ERROR0x05_NO_FOUND_USER);
                }
                break;
                
            default:
                break;
        }
        //这里的状态是底层UI.m检测到'...'，想切回主界面，但困在while出不去
        if (MyStatuP.StaNow == (SuperUser | S_home))
        {
            [self enterWaitTimer];
            break;
        }
    }
}

//==========================
//      修改用户信息
//==========================
-(void)uiSuperUserUpUserData
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *newuser        = [[Manageuserdatas alloc]init];    //要保存的实例
    Operateuserdatas *newop         = [[Operateuserdatas alloc]init];   //文件操作
    uisuper_Updata tempstatu        = uisuper_Updata_name;              //该方法的状态
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
   
    printf("=========================================\n");

    while(1)
    {
        switch (tempstatu)
        {
            case uisuper_Updata_name:
                printf("▶️请输入将要修改的用户名(🔙可输入'...'取消修改🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Name AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_Found)
                {
                    newuser = [olduserdata.name copy];
                    printf("✅查到的用户信息如下：\n");
                    [newuser printfAllData];
                    tempstatu = uisuper_Updata_realname;
                    printf("=========================================\n");
                }
                else if(temp_namestatu == LCQResultKeyRule_NoFound)
                {
                    printf("%s",ERROR0x05_NO_FOUND_USER);
                }
                break;
                
            case uisuper_Updata_realname:
                printf("▶️请输入该用户新的名字(🔙可输入'...'取消修改🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_RealName AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.realname = olduserdata.realname;
                    [newop upUserData:newuser withWho:LCQChooseUpdata_realname];
                    printf("=========================================\n");
                    printf("✅修改成功，新的用户信息如下：\n");
                    [newuser printfAllData];
                    printf("=========================================\n");
                    [self uiReturnUpUi:(SuperUser | S_home)];
                    return;
                }
                break;
            
            default:
                break;
        }
        //这里的状态是底层UI.m检测到'...'，想切回主界面，但困在while出不去
        if (MyStatuP.StaNow == (SuperUser | S_home))
        {
            [self enterWaitTimer];
            break;
        }
    }
}

//==========================
//      删除用户信息
//==========================
-(void)uiSuperUserDeleUserData
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiSuperUserUping];
}

//==========================
//      用户资金操作
//==========================
-(void)uiSuperUserOperaUserMoney
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiSuperUserUping];
}

//==========================
//      商品操作
//==========================
-(void)uiSuperUserOperaWares
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiSuperUserUping];
}

//==========================
//      订单操作
//==========================
-(void)uiSuperUserOperaOrder
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiSuperUserUping];
}

//==========================
//      添加用户
//==========================
-(void)uiSuperUserAddUser
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiSuperUserUping];
}

//==========================
//      密保库清0
//==========================
-(void)uiSuperUserCleProPassWord
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiSuperUserUping];
}

//==========================
//      资金历史记录清除
//==========================
-(void)uiSuperUserClemoneyhistory
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiSuperUserUping];
}

//==========================
//      查看用户密保
//==========================
-(void)uiSuperUserSeekProPassWord
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiSuperUserUping];
}

@end
