//
//  Operatemoney.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Operatemoney.h"

@implementation Operatemoney


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
-(FILESTATUS)creatTableForOpMoney
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }

    if ([fileop executeUpdate:@"CREATE TABLE IF NOT EXISTS OpMoney (opname TEXT REFERENCES UserDatas￼('name') ON DELETE CASCADE ON UPDATE CASCADE, allmoney INTEGER,opmoney INTEGER, opmoneytopeople TEXT REFERENCES UserDatas ('name') ON DELETE CASCADE ON UPDATE CASCADE, [CreatedTime] optime NOT NULL DEFAULT (datetime('now','localtime')))"] == NO)
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
-(FILESTATUS)addOpMoney:(Managemoney *)moneyop
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if ([fileop executeUpdate:@"INSERT INTO OpMoney(opname,allmoney,opmoney,opmoneytopeople) VALUES (?,?,?,?)",moneyop.opname,[NSNumber numberWithInteger:moneyop.allmoney],[NSNumber numberWithInteger:moneyop.opmoney],moneyop.opmoneytopeople] == NO )
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
-(FILESTATUS)selectOpMoneyName:(NSString*)name andSaveArray:(NSMutableArray**)array
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
        fileresult = [fileop executeQuery:@"SELECT opname,allmoney,opmoney,opmoneytopeople,CreatedTime From OpMoney"];
    }
    else                //单选
    {
        fileresult = [fileop executeQuery:@"SELECT opname,allmoney,opmoney,opmoneytopeople,CreatedTime From OpMoney where opname = ?",name];
    }
    
    while ([fileresult next])
    {
        Managemoney *temp_date = [[Managemoney alloc]init];
        
        temp_date.opname            = [fileresult stringForColumn:@"opname"];
        temp_date.allmoney          = [fileresult intForColumn:@"allmoney"];
        temp_date.opmoney           = [fileresult intForColumn:@"opmoney"];
        temp_date.opmoneytopeople   = [fileresult stringForColumn:@"opmoneytopeople"];
        temp_date.optime            = [fileresult stringForColumn:@"CreatedTime"];
        
        [dataarray addObject:temp_date];
    };
    
    *array = dataarray;
    
    [fileop close];
    return tempsta;
}

@end
