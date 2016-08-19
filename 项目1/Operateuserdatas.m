//
//  Operateuserdatas.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Operateuserdatas.h"

@implementation Operateuserdatas

//=====================================================
//  描述:路径名设置
//  输入:filename:文件名
//  返回:路径
//=====================================================
-(NSString *)filepath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"OnlineSaleSys.sqlite"];
}

//=====================================================
//  描述:创建表格
//  返回:错误代码
//=====================================================
-(FILESTATUS)creatTable
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if ([fileop executeUpdate:@"CREATE TABLE IF NOT EXISTS UserDatas (name TEXT primary key,password TEXT,realname TEXT,email TEXT,phonenum TEXT,member TEXT,question1 TEXT,answer1 TEXT,question2 TEXT,answer2 TEXT,question3 TEXT,answer3 TEXT,money INTEGER)"] == NO)
    {
        [fileop close];
        tempsta = FILEBuildError;
        return tempsta;
    }
    
    [fileop close];
    return tempsta;
}

//=====================================================
//  描述:在选定表格添加用户信息()
//  输入:userdate:添加的用户信息
//  返回:错误代码
//=====================================================
-(FILESTATUS)addUser:(Manageuserdatas *)userdate
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if ([fileop executeUpdate:@"INSERT INTO UserDatas(name,password,realname,email,phonenum,member,question1,answer1,question2,answer2,question3,answer3,money) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)",userdate.name,userdate.password,userdate.realname,userdate.email,userdate.phonenum,userdate.member,userdate.question1,userdate.answer1,userdate.question2,userdate.answer2,userdate.question3,userdate.answer3,[NSNumber numberWithInteger:userdate.money]] == NO )
    {
        [fileop close];
        tempsta = FILEAddError;
        return tempsta;
    }
    
    [fileop close];
    return tempsta;
}

//=====================================================
//  描述:选择查看信息，可单选可全选
//  输入:name:选择的用户，nil代表全选  array:读取出来保存的数组
//  返回:错误代码
//=====================================================
-(FILESTATUS)selectUser:(NSString*)name andSaveArray:(NSMutableArray**)array
{
    FILESTATUS tempsta = FILEYES;
    NSMutableArray *dataarray = [[NSMutableArray alloc]init];
    
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    FMResultSet *fileresult;
    
    if (name == nil)    //全选
    {
        fileresult = [fileop executeQuery:@"SELECT name,password,realname,email,phonenum,member,question1,answer1,question2,answer2,question3,answer3,money From UserDatas"];
    }
    else                //单选
    {
        fileresult = [fileop executeQuery:@"SELECT name,password,realname,email,phonenum,member,question1,answer1,question2,answer2,question3,answer3,money From UserDatas where name = ?",name];
    }
    
    while ([fileresult next])
    {
        Manageuserdatas *temp_date = [[Manageuserdatas alloc]init];
        
        temp_date.name      = [fileresult stringForColumn:@"name"];
        temp_date.password  = [fileresult stringForColumn:@"password"];
        temp_date.realname  = [fileresult stringForColumn:@"realname"];
        temp_date.email     = [fileresult stringForColumn:@"email"];
        temp_date.phonenum  = [fileresult stringForColumn:@"phonenum"];
        temp_date.member    = [fileresult stringForColumn:@"member"];
        temp_date.question1 = [fileresult stringForColumn:@"question1"];
        temp_date.answer1   = [fileresult stringForColumn:@"answer1"];
        temp_date.question2 = [fileresult stringForColumn:@"question2"];
        temp_date.answer2   = [fileresult stringForColumn:@"answer2"];
        temp_date.question3 = [fileresult stringForColumn:@"question3"];
        temp_date.answer3   = [fileresult stringForColumn:@"answer3"];
        temp_date.money     = [[fileresult stringForColumn:@"money"]integerValue];
        
        [dataarray addObject:temp_date];
    };
    
    *array = dataarray;
    
    [fileop close];
    return tempsta;
}

//=====================================================
//  描述:删除用户信息
//  输入:name:选择的用户
//  返回:错误代码
//=====================================================
-(FILESTATUS)deletUser:(NSString *)name
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if (name == nil)
    {
        if ([fileop executeUpdate:@"DELETE FROM UserDatas"] == NO )
        {
            [fileop close];
            tempsta = FILEDeleError;
            return tempsta;
        }
    }
    else
    {
        if ([fileop executeUpdate:@"DELETE FROM UserDatas WHERE name = ?",name] == NO )
        {
            [fileop close];
            tempsta = FILEDeleError;
            return tempsta;
        }
    }
    
    [fileop close];
    return tempsta;
}

//=====================================================
//  描述:更新用户信息
//  输入:name:选择的用户
//  返回:错误代码
//=====================================================
-(FILESTATUS)upUserData:(Manageuserdatas *)userdate withWho:(LCQChooseUpdata)who
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    switch (who)
    {
        case LCQChooseUpdata_password:
            if ([fileop executeUpdate:@"UPDATE UserDatas SET password = ? where name = ?",userdate.password,userdate.name] == NO )
            {
                [fileop close];
                tempsta = FILEUpDataError;
                return tempsta;
            }
            break;
            
        case LCQChooseUpdata_realname:
            if ([fileop executeUpdate:@"UPDATE UserDatas SET realname = ? where name = ?",userdate.realname,userdate.name] == NO )
            {
                [fileop close];
                tempsta = FILEUpDataError;
                return tempsta;
            }
            break;

            
        case LCQChooseUpdata_email:
            if ([fileop executeUpdate:@"UPDATE UserDatas SET email = ? where name = ?",userdate.email,userdate.name] == NO )
            {
                [fileop close];
                tempsta = FILEUpDataError;
                return tempsta;
            }
            break;
            
        case LCQChooseUpdata_phonenum:
            if ([fileop executeUpdate:@"UPDATE UserDatas SET phonenum = ? where name = ?",userdate.phonenum,userdate.name] == NO )
            {
                [fileop close];
                tempsta = FILEUpDataError;
                return tempsta;
            }
            break;
            
 
        case LCQChooseUpdata_member:
            if ([fileop executeUpdate:@"UPDATE UserDatas SET member = ? where name = ?",userdate.member,userdate.name] == NO )
            {
                [fileop close];
                tempsta = FILEUpDataError;
                return tempsta;
            }
            break;
            
        case LCQChooseUpdata_question1:
            if ([fileop executeUpdate:@"UPDATE UserDatas SET question1 = ? where name = ?",userdate.question1,userdate.name] == NO )
            {
                [fileop close];
                tempsta = FILEUpDataError;
                return tempsta;
            }
            break;
            
        case LCQChooseUpdata_answer1:
            if ([fileop executeUpdate:@"UPDATE UserDatas SET answer1 = ? where name = ?",userdate.answer1,userdate.name] == NO )
            {
                [fileop close];
                tempsta = FILEUpDataError;
                return tempsta;
            }
            break;
            
        case LCQChooseUpdata_question2:
            if ([fileop executeUpdate:@"UPDATE UserDatas SET question2 = ? where name = ?",userdate.question2,userdate.name] == NO )
            {
                [fileop close];
                tempsta = FILEUpDataError;
                return tempsta;
            }
            break;
            
        case LCQChooseUpdata_answer2:
            if ([fileop executeUpdate:@"UPDATE UserDatas SET answer2 = ? where name = ?",userdate.answer2,userdate.name] == NO )
            {
                [fileop close];
                tempsta = FILEUpDataError;
                return tempsta;
            }
            break;
            
        case LCQChooseUpdata_question3:
            if ([fileop executeUpdate:@"UPDATE UserDatas SET question3 = ? where name = ?",userdate.question3,userdate.name] == NO )
            {
                [fileop close];
                tempsta = FILEUpDataError;
                return tempsta;
            }
            break;
            
        case LCQChooseUpdata_answer3:
            if ([fileop executeUpdate:@"UPDATE UserDatas SET answer3 = ? where name = ?",userdate.answer3,userdate.name] == NO )
            {
                [fileop close];
                tempsta = FILEUpDataError;
                return tempsta;
            }
            break;
            
        case LCQChooseUpdata_money:
            if ([fileop executeUpdate:@"UPDATE UserDatas SET money = ? where name = ?",[NSNumber numberWithInteger:userdate.money],userdate.name] == NO )
            {
                [fileop close];
                tempsta = FILEUpDataError;
                return tempsta;
            }
            break;
            
            
            
        case LCQChooseUpdata_deleanswer:
            if (userdate == nil)
            {
                if ([fileop executeUpdate:@"UPDATE UserDatas SET answer1 = null"] == NO )
                {
                    [fileop close];
                    tempsta = FILEUpDataError;
                    return tempsta;
                }
                if ([fileop executeUpdate:@"UPDATE UserDatas SET answer2 = null"] == NO )
                {
                    [fileop close];
                    tempsta = FILEUpDataError;
                    return tempsta;
                }
                if ([fileop executeUpdate:@"UPDATE UserDatas SET answer3 = null"] == NO )
                {
                    [fileop close];
                    tempsta = FILEUpDataError;
                    return tempsta;
                }
            }
            else
            {
                if ([fileop executeUpdate:@"UPDATE UserDatas SET answer1 = null where name = ?",userdate.name] == NO )
                {
                    [fileop close];
                    tempsta = FILEUpDataError;
                    return tempsta;
                }
                if ([fileop executeUpdate:@"UPDATE UserDatas SET answer2 = null where name = ?",userdate.name] == NO )
                {
                    [fileop close];
                    tempsta = FILEUpDataError;
                    return tempsta;
                }
                if ([fileop executeUpdate:@"UPDATE UserDatas SET answer3 = null where name = ?",userdate.name] == NO )
                {
                    [fileop close];
                    tempsta = FILEUpDataError;
                    return tempsta;
                }
            }
            break;
            
        default:
            break;
    }

    
    [fileop close];
    return tempsta;
}

-(NSString *)plistpath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"common.plist"];
}


-(FILESTATUS)saveCommonUserData:(Manageuserdatas*)userdata
{
    NSMutableDictionary *userdic = [[NSMutableDictionary alloc]init];
    
    [userdic setValue:userdata.name forKey:@"name"];
    [userdic setValue:userdata.password forKey:@"password"];
    [userdic setValue:userdata.realname forKey:@"realname"];
    [userdic setValue:userdata.email forKey:@"email"];
    [userdic setValue:userdata.phonenum forKey:@"phonenum"];
    [userdic setValue:userdata.member forKey:@"member"];
    [userdic setValue:userdata.question1 forKey:@"question1"];
    [userdic setValue:userdata.answer1 forKey:@"answer1"];
    [userdic setValue:userdata.question2 forKey:@"question2"];
    [userdic setValue:userdata.answer2 forKey:@"answer2"];
    [userdic setValue:userdata.question3 forKey:@"question3"];
    [userdic setValue:userdata.answer3 forKey:@"answer3"];
    [userdic setValue:[NSNumber numberWithInteger:userdata.money] forKey:@"money"];
    

    if ([userdic writeToFile:[self plistpath] atomically:YES])
    {
        return FILEUpPlistOk;
    }
    else
    {
        return FILEUpPlistError;
    }
}

-(Manageuserdatas *)readCommonUserData
{
    NSMutableDictionary  *saveuserdata = [[NSMutableDictionary alloc]init];
    saveuserdata = [NSMutableDictionary dictionaryWithContentsOfFile:[self plistpath]];
    
    Manageuserdatas *tempuser = [[Manageuserdatas alloc]init];
    
    tempuser.name       = [saveuserdata objectForKey:@"name"];
    tempuser.password   = [saveuserdata objectForKey:@"password"];
    tempuser.realname   = [saveuserdata objectForKey:@"realname"];
    tempuser.email      = [saveuserdata objectForKey:@"email"];
    tempuser.phonenum   = [saveuserdata objectForKey:@"phonenum"];
    tempuser.member     = [saveuserdata objectForKey:@"member"];
    tempuser.question1  = [saveuserdata objectForKey:@"question1"];
    tempuser.answer1    = [saveuserdata objectForKey:@"answer1"];
    tempuser.question2  = [saveuserdata objectForKey:@"question2"];
    tempuser.answer2    = [saveuserdata objectForKey:@"answer2"];
    tempuser.question3  = [saveuserdata objectForKey:@"question3"];
    tempuser.answer3    = [saveuserdata objectForKey:@"answer3"];
    tempuser.money      = [[saveuserdata objectForKey:@"money"]integerValue];
    
    return tempuser;
}

@end
