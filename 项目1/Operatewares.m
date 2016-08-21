//
//  Operatewares.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Operatewares.h"

@implementation Operatewares

//=====================================================
//  描述:路径名设置
//  输入:filename:文件名
//  返回:路径
//=====================================================
-(NSString *)filepath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:FILEPATH];
}

//=====================================================
//  描述:创建表格
//  返回:错误代码
//=====================================================
-(FILESTATUS)creatTableForWare
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if ([fileop executeUpdate:@"CREATE TABLE IF NOT EXISTS Ware (warebypeople TEXT REFERENCES UserDatas￼('name') ON DELETE CASCADE ON UPDATE CASCADE, wareflag TEXT,warename TEXT,wareclass TEXT, wareprice INTEGER,waresum INTEGER)"] == NO)
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
//  输入:waredata:添加的用户信息
//  返回:错误代码
//=====================================================
-(FILESTATUS)addWare:(Managewares *)waredata
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if ([fileop executeUpdate:@"INSERT INTO Ware(warebypeople,wareflag,warename,wareclass,wareprice,waresum) VALUES (?,?,?,?,?,?)",waredata.warebypeople,waredata.wareflag,waredata.warename,waredata.wareclass,[NSNumber numberWithInteger:waredata.wareprice],[NSNumber numberWithInteger:waredata.waresum]] == NO )
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
-(FILESTATUS)selectWareByWho:(NSString*)name andFlag:(NSString*)flag andWare:(NSString*)ware andClass:(NSString*)class andSaveArray:(NSMutableArray**)array
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
    
    if (name == nil && flag == nil && ware == nil && class == nil)
    {
        fileresult = [fileop executeQuery:@"SELECT warebypeople,wareflag,warename,wareclass,wareprice,waresum From Ware"];
    }
    else if(name != nil && flag != nil && ware == nil && class == nil)
    {
        fileresult = [fileop executeQuery:@"SELECT warebypeople,wareflag,warename,wareclass,wareprice,waresum From Ware where warebypeople = ? and wareflag = ?",name,flag];
    }
    else if(name == nil && flag == nil && ware != nil && class == nil)
    {
        fileresult = [fileop executeQuery:@"SELECT warebypeople,wareflag,warename,wareclass,wareprice,waresum From Ware where warename = ?",ware];
    }
    else if(name == nil && flag != nil && ware != nil && class == nil)
    {
        fileresult = [fileop executeQuery:@"SELECT warebypeople,wareflag,warename,wareclass,wareprice,waresum From Ware where warename = ? and wareflag = ?",ware,flag];
    }
    else if(name == nil && flag != nil && ware == nil && class != nil)
    {
        fileresult = [fileop executeQuery:@"SELECT warebypeople,wareflag,warename,wareclass,wareprice,waresum From Ware where wareflag = ? and wareclass = ?",flag,class];
    }
    
    while ([fileresult next])
    {
        Managewares *temp_date = [[Managewares alloc]init];
        
        temp_date.warebypeople  = [fileresult stringForColumn:@"warebypeople"];
        temp_date.wareflag      = [fileresult stringForColumn:@"wareflag"];
        temp_date.warename      = [fileresult stringForColumn:@"warename"];
        temp_date.wareclass     = [fileresult stringForColumn:@"wareclass"];
        temp_date.wareprice     = [fileresult intForColumn:@"wareprice"];
        temp_date.waresum       = [fileresult intForColumn:@"waresum"];
        
        [dataarray addObject:temp_date];
    };
    
    *array = dataarray;
    
    [fileop close];
    return tempsta;
}

//=====================================================
//  描述:删除用户资金信息
//  输入:name:选择的用户
//  返回:错误代码
//=====================================================
-(FILESTATUS)deletWareByWho:(NSString *)name
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
        if ([fileop executeUpdate:@"DELETE FROM Ware"] == NO )
        {
            [fileop close];
            tempsta = FILEDeleError;
            return tempsta;
        }
    }
    else
    {
        if ([fileop executeUpdate:@"DELETE FROM Ware WHERE warebypeople = ?",name] == NO )
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
//  输入:waredata:选择的用户
//  返回:错误代码
//=====================================================
-(FILESTATUS)upWareData:(Managewares *)waredata withStatu:(LCQChooseUpWaredata)statu
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    switch (statu)
    {

        case LCQChooseUpWaredata_wareflag:
            if ([fileop executeUpdate:@"UPDATE Ware SET wareflag = ? where warebypeople = ? and warename = ? ",waredata.wareflag,waredata.warebypeople,waredata.warename] == NO )
            {
                [fileop close];
                tempsta = FILEUpDataError;
                return tempsta;
            }
            break;

        default:
            break;
    }

    [fileop close];
    return tempsta;
   
}
@end
