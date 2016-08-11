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
    
    if ([fileop executeUpdate:@"CREATE TABLE IF NOT EXISTS UserDatas (name TEXT primary key,password TEXT,email TEXT,phonenum TEXT,member TEXT,question1 TEXT,answer1 TEXT,question2 TEXT,answer2 TEXT,question3 TEXT,answer3 TEXT,)"] == NO)
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
    
    if ([fileop executeUpdate:@"INSERT INTO UserDatas(name,password,email,phonenum,member,question1,answer1,question2,answer2,question3,answer3) VALUES (?,?,?,?,?,?,?,?,?,?,?)",userdate.name,userdate.password,userdate.email,userdate.phonenum,userdate.member,userdate.question1,userdate.answer1,userdate.question2,userdate.answer2,userdate.question3,userdate.answer3] == NO )
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
        fileresult = [fileop executeQuery:@"SELECT name,password,email,phonenum,member,question1,answer1,question2,answer2,question3,answer3 From UserDatas"];
    }
    else                //单选
    {
        fileresult = [fileop executeQuery:@"SELECT name,password,email,phonenum,member,question1,answer1,question2,answer2,question3,answer3 From UserDatas where name = ?",name];
    }
    
    while ([fileresult next])
    {
        Manageuserdatas *temp_date = [[Manageuserdatas alloc]init];
        
        temp_date.name      = [fileresult stringForColumn:@"name"];
        temp_date.password  = [fileresult stringForColumn:@"password"];
        temp_date.email     = [fileresult stringForColumn:@"email"];
        temp_date.phonenum  = [fileresult stringForColumn:@"phonenum"];
        temp_date.member    = [fileresult stringForColumn:@"member"];
        temp_date.question1 = [fileresult stringForColumn:@"question1"];
        temp_date.answer1   = [fileresult stringForColumn:@"answer1"];
        temp_date.question2 = [fileresult stringForColumn:@"question2"];
        temp_date.answer2   = [fileresult stringForColumn:@"answer2"];
        temp_date.question3 = [fileresult stringForColumn:@"question3"];
        temp_date.answer3   = [fileresult stringForColumn:@"answer3"];
    
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
    
    if ([fileop executeUpdate:@"DELETE FROM UserDatas WHERE name = ?",name] == NO )
    {
        [fileop close];
        tempsta = FILEDeleError;
        return tempsta;
    }
    
    [fileop close];
    return tempsta;
}

//=====================================================
//  描述:更新用户信息
//  输入:name:选择的用户
//  返回:错误代码
//=====================================================
-(FILESTATUS)upUserData:(Manageuserdatas *)userdate
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if ([fileop executeUpdate:@"UPDATE UserDatas SET password = ? where name = ?",userdate.password,userdate.name] == NO )
    {
        [fileop close];
        tempsta = FILEUpDataError;
        return tempsta;
    }
    
    [fileop close];
    return tempsta;
}



@end
