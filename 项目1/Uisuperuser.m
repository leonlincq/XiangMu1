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
    Status *MyStatuP = [Status statusShallOneData];
    
    switch (MyStatuP.StaNow)
    {
        case ( MainInterface | M_home ):
            printf("🕐%ld秒后进入主界面...\n",_countByTimer--);
            break;
            
        case ( SuperUser | S_home ):
            printf("🕐%ld秒后返回超级用户界面...\n",_countByTimer--);
            break;
            
        case ( CommonUser | C_home ):
            printf("🕐%ld秒后进入普通用户界面...\n",_countByTimer--);
            break;
            
        default:
            break;
    }

    if(_countByTimer == 0)
    {
        [_myTick setFireDate:[NSDate distantFuture]];
    }
}

//==========================
//      进入等待定时器
//==========================
-(void)enterWaitTimer
{
    _countByTimer = ReturuSperUserTime;
    [_myTick setFireDate:[NSDate distantPast]];
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:ReturuSperUserTime];
    [[NSRunLoop currentRunLoop] runUntilDate:date];
    printf("======================================\n");
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
    printf("✅           🐴1.查看用户信息           \n");
    printf("✅           🐑2.修改用户名字           \n");
    printf("✅           🐧3.删除用户信息           \n");
    printf("             🐶4.用户资金操作           \n");
    printf("             🐘5.商品操作               \n");
    printf("             🐤6.订单操作               \n");
    printf("✅           🐔7.添加用户               \n");
    printf("✅           🐹8.密保库清0              \n");
    printf("             🐼9.历史资金清除           \n");
    printf("✅           🐬10.查看用户密保          \n");
    printf("✅           🐠11.返回登录界面          \n");
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
                    [self enterWaitTimer];
                    return;
                        
                default:
                    printf("%s",ERROR0x01_ILLEGAL_NUM);
                    break;
            }//判断数字
        }
    }//结束while
}

//==========================
//      查看用户信息
//==========================
-(void)uiSuperUserSeekUserData
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *newuser        = [[Manageuserdatas alloc]init];    //要保存的实例
    Operateuserdatas *newop         = [[Operateuserdatas alloc]init];   //文件操作
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    NSMutableArray *tempuser        = [[NSMutableArray alloc]init];     //保存的数组
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态

    uisuper_Seek tempstatu          = uisuper_Seek_makechoose;          //该方法的状态
    printf("=========================================\n");

    while(1)
    {
        switch (tempstatu)
        {
            case uisuper_Seek_makechoose:
                printf("         1️⃣.查看所有用户");
                printf("         2️⃣.查看单个用户");
                printf("▶️请输入操作序号(1~2)(🔙可输入'...'取消查看🔙):");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    int tempjudge = [olduserdata.member intValue];
                    switch (tempjudge)
                    {
                        case uisuper_Seek_chooseall:
                            tempstatu = tempjudge;
                            printf("=========================================\n");
                            break;
                            
                        case uisuper_Seek_chooseone:
                            tempstatu = tempjudge;
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
                    printf("---------");
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
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
   
    uisuper_Updata tempstatu        = uisuper_Updata_name;              //该方法的状态
    
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
                    newuser = [olduserdata copy];
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
                    tempstatu = uisuper_Updata_password;
                }
                break;
            
            case uisuper_Updata_password:
                printf("▶️请输入超级用户密码以获取权限修改(🔙可输入'...'取消修改🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Admin AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
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
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *newuser        = [[Manageuserdatas alloc]init];    //要保存的实例
    Operateuserdatas *newop         = [[Operateuserdatas alloc]init];   //文件操作
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态

    uisuper_Delete tempstatu        = uisuper_Delete_name;              //该方法的状态
    uisuper_Delete_choose deletechoose = uisuper_Delete_choosenil;      //是删除全部跳来的还是删除单个跳来的
    printf("=========================================\n");
    
    while(1)
    {
        switch (tempstatu)
        {
            case uisuper_Delete_name:
                printf("         1️⃣.删除所有用户");
                printf("         2️⃣.删除单个用户");
                printf("▶️请输入操作序号(1~2)(🔙可输入'...'取消查看🔙):");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    int tempjudge = [olduserdata.member intValue];
                    switch ( tempjudge )
                    {
                        case uisuper_Delete_all:
                            tempstatu = tempjudge;
                            printf("=========================================\n");
                            break;
                        case uisuper_Delete_one:
                            tempstatu = tempjudge;
                            printf("=========================================\n");                    
                            break;
                        default:
                            printf("%s",ERROR0x01_ILLEGAL_NUM);
                            break;
                    }
                }
                break;
                
            case uisuper_Delete_all:
                deletechoose = uisuper_Delete_chooseall;
                tempstatu = uisuper_Delete_password;
                break;

            case uisuper_Delete_one:
                printf("▶️请输入将要删除的用户名(🔙可输入'...'取消删除🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Name AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_Found)
                {
                    newuser = [olduserdata copy];
                    printf("✅查到的用户信息如下：\n");
                    [newuser printfAllData];
                    deletechoose = uisuper_Delete_chooseone;
                    tempstatu = uisuper_Delete_password;
                    printf("=========================================\n");
                }
                else if(temp_namestatu == LCQResultKeyRule_NoFound)
                {
                    printf("%s",ERROR0x05_NO_FOUND_USER);
                }
                break;
                
                
            case uisuper_Delete_password:
                printf("▶️请输入超级用户密码以获取权限删除(🔙可输入'...'取消删除🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Admin AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    tempstatu = uisuper_Delete_sureorno;
                }
                break;
                
            case uisuper_Delete_sureorno:
                printf("▶️是否要删除:(输入'YES'或'N0')(🔙可输入'...'取消删除🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_YesOrNo AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    if ([olduserdata.member characterAtIndex:0] == 'Y' || [olduserdata.member characterAtIndex:0] == 'y')
                    {
                        tempstatu = uisuper_Delete_yes;
                    }
                    else
                    {
                        tempstatu = uisuper_Delete_no;
                    }
                    printf("=========================================\n");
                }
                break;
                
            case uisuper_Delete_yes:
                if (deletechoose == uisuper_Delete_chooseone)
                {
                    if ( [newop deletUser:newuser.name] == FILEYES )
                    {
                        printf("✅删除");
                        [newuser printfName];
                        printf("成功\n");
                        [MyStatuP StatuChange:(SuperUser | S_home)];
                        [self enterWaitTimer];
                        return;
                    }
                }
                else if (deletechoose == uisuper_Delete_chooseall)
                {
                    if ( [newop deletUser:nil] == FILEYES )
                    {
                        printf("✅删除所有用户成功\n");
                        [MyStatuP StatuChange:(SuperUser | S_home)];
                        [self enterWaitTimer];
                        return;
                    }
                }
                break;
                
            case uisuper_Delete_no:
                tempstatu = uisuper_Delete_name;
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
//     Ui超级用户界面功能升级中
//==========================
-(void)uiSuperUserUping
{
    Status *MyStatuP = [Status statusShallOneData];
    
    printf("升级ing...\n");
    [MyStatuP StatuChange:(SuperUser | S_home)];
    [self enterWaitTimer];
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
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *newuser        = [[Manageuserdatas alloc]init];    //要保存的实例
    Operateuserdatas *newop         = [[Operateuserdatas alloc]init];   //文件操作
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
    
    uisuper_AddUser tempstatu            = uisuper_AddUser_name;                  //该方法的状态
    printf("=========================================\n");
    
    while (1)
    {
        switch (tempstatu)
        {
            case uisuper_AddUser_name:                //输入用户
                printf("▶️请输入用户名(6-30位，只能是数字、字母、下划线)(🔙可输入'...'取消添加🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Name AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_Found)
                {
                    printf("%s",ERROR0x04_REPE_NAME);
                }
                else if(temp_namestatu == LCQResultKeyRule_NoFound)
                {
                    newuser.name = olduserdata.name;
                    tempstatu = uisuper_AddUser_password;
                    printf("=========================================\n");
                }
                break;
                
            case uisuper_AddUser_password:                //输入密码
                printf("▶️请输入密码(6-30位)(🔙可输入'...'取消添加🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_PassWord AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.password = olduserdata.password;
                    tempstatu = uisuper_AddUser_realname;
                    printf("=========================================\n");
                }
                break;
                
            case uisuper_AddUser_realname:                //输入真名
                printf("▶️请输入真名(6-30位英文字母)(🔙可输入'...'取消添加🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_RealName AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.realname = olduserdata.realname;
                    tempstatu = uisuper_AddUser_email;
                    printf("=========================================\n");
                }
                break;
                
            case uisuper_AddUser_email:                //输入邮箱
                printf("▶️请输入邮箱地址(🔙可输入'...'取消添加🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Email AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.email = olduserdata.email;
                    tempstatu = uisuper_AddUser_phonenum;
                    printf("=========================================\n");
                }
                break;
                
            case uisuper_AddUser_phonenum:                //输入电话
                printf("▶️请输入电话号码(只能是13开头)或座机号码(座机可不加区号，加区号得用-隔开)(🔙可输入'...'取消添加🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Phonenum AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.phonenum = olduserdata.phonenum;
                    tempstatu = uisuper_AddUser_member;
                    printf("=========================================\n");
                }
                break;
                
            case uisuper_AddUser_member:               //输入会员
                printf("▶️请输入会员等级(⬇️1-10⬆️)(🔙可输入'...'取消添加🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Member AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    int tempjudge = [olduserdata.member intValue];
                    if ( tempjudge >= 1 && tempjudge <= 10 )
                    {
                        newuser.member = [NSString stringWithFormat:@"%@级会员",olduserdata.member];
                        tempstatu = uisuper_AddUser_question1;
                        printf("=========================================\n");
                    }
                    else
                    {
                        printf("%s",ERROR0x01_ILLEGAL_NUM);
                    }
                }
                break;
                
            case uisuper_AddUser_question1:
                newuser.question1 = @QUESTION_FRIST;
                tempstatu = uisuper_AddUser_answer1;
                break;
                
            case uisuper_AddUser_answer1:             //输入密保1答案
                printf("▶️第一个密保问题：%s\n",QUESTION_FRIST);
                printf("▶️请输入第一个密保答案(🔙可输入'...'取消添加🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Answer1 AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.answer1 = olduserdata.answer1;
                    tempstatu = uisuper_AddUser_question2;
                    printf("=========================================\n");
                }
                break;
                
            case uisuper_AddUser_question2:
                newuser.question2 = @QUESTION_SECON;
                tempstatu = uisuper_AddUser_answer2;
                break;
                
            case uisuper_AddUser_answer2:               //输入密保2答案
                printf("▶️第二个密保问题：%s\n",QUESTION_SECON);
                printf("▶️请输入第二个密保答案(🔙可输入'...'取消添加🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Answer2 AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.answer2 = olduserdata.answer2;
                    tempstatu = uisuper_AddUser_question3;
                    printf("=========================================\n");
                }
                break;
                
            case uisuper_AddUser_question3:
                newuser.question3 = @QUESTION_THREE;
                tempstatu = uisuper_AddUser_answer3;
                break;
                
            case uisuper_AddUser_answer3:               //输入密保3答案
                printf("▶️第三个密保问题：%s\n",QUESTION_THREE);
                printf("▶️请输入第三个密保答案(🔙可输入'...'取消添加🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Answer3 AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.answer3 = olduserdata.answer3;
                    tempstatu = uisuper_AddUser_ok;
                    printf("=========================================\n");
                }
                break;
                
            case uisuper_AddUser_ok:
                [newop addUser:newuser];
                printf("✅添加成功，信息如下:\n");
                [newuser printfAllData];
                [super uiReturnUpUi:(SuperUser | S_home)];
                return;
                
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
//      密保库清0
//==========================
-(void)uiSuperUserCleProPassWord
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *newuser        = [[Manageuserdatas alloc]init];    //要保存的实例
    Operateuserdatas *newop         = [[Operateuserdatas alloc]init];   //文件操作
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
    
    uisuper_CleanProPassword tempstatu  = uisuper_CleanProPassword_name;              //该方法的状态
    uisuper_Clean_choose cleanchoose = uisuper_Clean_choosenil;
    printf("=========================================\n");
    
    while(1)
    {
        switch (tempstatu)
        {
            case uisuper_CleanProPassword_name:
                printf("         1️⃣.清空所有用户密保");
                printf("         2️⃣.清空单个用户密保");
                printf("▶️请输入操作序号(1~2)(🔙可输入'...'取消查看🔙):");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    int tempjudge = [olduserdata.member intValue];
                    switch ( tempjudge )
                    {
                        case uisuper_CleanProPassword_all:
                            tempstatu = tempjudge;
                            printf("=========================================\n");
                            break;
                        case uisuper_CleanProPassword_one:
                            tempstatu = tempjudge;
                            printf("=========================================\n");
                            break;
                        default:
                            printf("%s",ERROR0x01_ILLEGAL_NUM);
                            break;
                    }
                }
                break;
                
            case uisuper_CleanProPassword_all:
                cleanchoose = uisuper_Clean_chooseall;
                tempstatu = uisuper_CleanProPassword_password;
                break;
                
            case uisuper_CleanProPassword_one:
                printf("▶️请输入将要清空密保的用户名(🔙可输入'...'取消清空🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Name AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_Found)
                {
                    newuser = [olduserdata copy];
                    printf("✅查到的用户信息如下：\n");
                    [newuser printfAllData];
                    cleanchoose = uisuper_Clean_chooseone;
                    tempstatu = uisuper_Delete_password;
                    printf("=========================================\n");
                }
                else if(temp_namestatu == LCQResultKeyRule_NoFound)
                {
                    printf("%s",ERROR0x05_NO_FOUND_USER);
                }
                break;
                
            case uisuper_CleanProPassword_password:
                printf("▶️请输入超级用户密码以获取权限清空(🔙可输入'...'取消清空🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Admin AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    tempstatu = uisuper_CleanProPassword_sureorno;
                }
                break;

                
            case uisuper_CleanProPassword_sureorno:
                printf("▶️是否要删除:(输入'YES'或'N0')(🔙可输入'...'取消清空🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_YesOrNo AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    if ([olduserdata.member characterAtIndex:0] == 'Y' || [olduserdata.member characterAtIndex:0] == 'y')
                    {
                        tempstatu = uisuper_CleanProPassword_yes;
                    }
                    else
                    {
                        tempstatu = uisuper_CleanProPassword_no;
                    }
                    printf("=========================================\n");
                }
                break;
                
            case uisuper_CleanProPassword_yes:
                if (cleanchoose == uisuper_Clean_chooseone)
                {
                    if ( [newop upUserData:newuser withWho:LCQChooseUpdata_deleanswer] == FILEYES )
                    {
                        printf("✅清空");
                        [newuser printfName];
                        printf("密保成功\n");
                        [MyStatuP StatuChange:(SuperUser | S_home)];
                        [self enterWaitTimer];
                        return;
                    }
                }
                else if (cleanchoose == uisuper_Clean_chooseall)
                {
                    if ( [newop upUserData:nil withWho:LCQChooseUpdata_deleanswer] == FILEYES )
                    {
                        printf("✅清空所有用户密保成功\n");
                        [MyStatuP StatuChange:(SuperUser | S_home)];
                        [self enterWaitTimer];
                        return;
                    }
                }
                break;
                
            case uisuper_CleanProPassword_no:
                tempstatu = uisuper_CleanProPassword_name;
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
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *newuser        = [[Manageuserdatas alloc]init];    //要保存的实例
    Operateuserdatas *newop         = [[Operateuserdatas alloc]init];   //文件操作
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    NSMutableArray *tempuser        = [[NSMutableArray alloc]init];     //保存的数组
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
    
    uisuper_SeekProPassword tempstatu  = uisuper_SeekProPassword_makechoose;              //该方法的状态
    printf("=========================================\n");
    
    while(1)
    {
        switch (tempstatu)
        {
            case uisuper_SeekProPassword_makechoose:
                printf("         1️⃣.查看所有用户");
                printf("         2️⃣.查看单个用户");
                printf("▶️请输入操作序号(1~2)(🔙可输入'...'取消查看🔙):");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    int tempjudge = [olduserdata.member intValue];
                    switch (tempjudge)
                    {
                        case uisuper_SeekProPassword_chooseall:
                            tempstatu = tempjudge;
                            printf("=========================================\n");
                            break;
                            
                        case uisuper_SeekProPassword_chooseone:
                            tempstatu = tempjudge;
                            printf("=========================================\n");
                            break;
                        default:
                            printf("%s",ERROR0x01_ILLEGAL_NUM);
                            break;
                    }
                }
                break;
                
            case uisuper_SeekProPassword_chooseall:
                [newop selectUser:nil andSaveArray:&tempuser];
                for (int i =0; i<tempuser.count; i++)
                {
                    newuser = [tempuser[i] copy];
                    [newuser printfAllAnswer];
                }
                [self uiReturnUpUi:(SuperUser | S_home)];
                break;
                
            case uisuper_SeekProPassword_chooseone:
                printf("▶️请输入要查看的用户名(🔙可输入'...'取消查看🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Name AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_Found)
                {
                    newuser = [olduserdata copy];
                    [newuser printfAllAnswer];
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

@end
