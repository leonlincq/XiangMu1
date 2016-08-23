//
//  Operatebuyandsale.m
//  项目1
//
//  Created by etcxm on 16/8/23.
//  Copyright © 2016年 etc. All rights reserved.
//

#import "Operatebuyandsale.h"

@implementation Operatebuyandsale

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
-(FILESTATUS)creatTableForOpBuyAndSale
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if ([fileop executeUpdate:@"CREATE TABLE IF NOT EXISTS OpBuyAndSale (basopname TEXT REFERENCES UserDatas('name') ON DELETE CASCADE ON UPDATE CASCADE, basallmoney INTEGER,basordernumb INTEGER, basopaction TEXT, basopmoney INTEGER, basopmoneytopeople TEXT REFERENCES UserDatas ('name') ON DELETE CASCADE ON UPDATE CASCADE, [CreatedTime] optime NOT NULL DEFAULT (datetime('now','localtime')))"] == NO)
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
//  输入:moneyop:添加的用户信息
//  返回:错误代码
//=====================================================
-(FILESTATUS)addOpBuyAndSale:(Managebuyandsale *)basop
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if ([fileop executeUpdate:@"INSERT INTO OpBuyAndSale(basopname,basallmoney,basordernumb,basopaction,basopmoney,basopmoneytopeople) VALUES (?,?,?,?,?,?)",basop.basopname,[NSNumber numberWithInteger:basop.basallmoney],[NSNumber numberWithInteger:basop.basordernumb],basop.basopaction,[NSNumber numberWithInteger:basop.basopmoney],basop.basopmoneytopeople] == NO )
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
-(FILESTATUS)selectOpBuyAndSaleName:(NSString*)name andOrderNum:(NSInteger)num andop:(NSString*)op SaveArray:(NSMutableArray**)array
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
    
    if (name !=nil && op == nil && num == 0)        //查看某人的所有操作
    {
        fileresult = [fileop executeQuery:@"SELECT basopname,basallmoney,basordernumb,basopaction,basopmoney,basopmoneytopeople,CreatedTime From OpBuyAndSale where basopname = ?",name];
    }
    else if (name !=nil && op != nil && num == 0)   //查看某人的某项操作
    {
        fileresult = [fileop executeQuery:@"SELECT basopname,basallmoney,basordernumb,basopaction,basopmoney,basopmoneytopeople,CreatedTime From OpBuyAndSale where basopname = ? and basopaction = ?",name,op];
    }
    else if (name !=nil && op != nil && num != 0)   //查看某人、某项、某订单号操作
    {
        fileresult = [fileop executeQuery:@"SELECT basopname,basallmoney,basordernumb,basopaction,basopmoney,basopmoneytopeople,CreatedTime From OpBuyAndSale where basopname = ? and basopaction = ?a nd basordernumb = ?",name,op,num];
    }
    
    
    
    while ([fileresult next])
    {
        Managebuyandsale *temp_date = [[Managebuyandsale alloc]init];
        
        temp_date.basopname             = [fileresult stringForColumn:@"basopname"];
        temp_date.basallmoney           = [fileresult intForColumn:@"basallmoney"];
        temp_date.basordernumb          = [fileresult intForColumn:@"basordernumb"];
        temp_date.basopaction           = [fileresult stringForColumn:@"basopaction"];
        temp_date.basopmoney            = [fileresult intForColumn:@"basopmoney"];
        temp_date.basopmoneytopeople    = [fileresult stringForColumn:@"basopmoneytopeople"];
        temp_date.basoptime             = [fileresult stringForColumn:@"CreatedTime"];
        
        [dataarray addObject:temp_date];
    };
    [fileop close];
    
    *array = dataarray;
    return tempsta;
}

//=====================================================
//  描述:删除用户
//  输入:name:选择的用户，nil代表全选  array:读取出来保存的数组
//  返回:错误代码
//=====================================================
-(FILESTATUS)deletBuyAndSaleByWho:(NSString *)name andOrderNum:(NSInteger)ordernum
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if (name == nil && ordernum == 0)
    {
        if ([fileop executeUpdate:@"DELETE FROM OpBuyAndSale"] == NO )
        {
            [fileop close];
            tempsta = FILEDeleError;
            return tempsta;
        }
    }
    else if (name != nil && ordernum == 0)
    {
        if ([fileop executeUpdate:@"DELETE FROM OpBuyAndSale WHERE basopname = ? ",name] == NO )
        {
            [fileop close];
            tempsta = FILEDeleError;
            return tempsta;
        }
    }
    else if (name != nil && ordernum != 0)
    {
        if ([fileop executeUpdate:@"DELETE FROM OpBuyAndSale WHERE basopname = ? and basordernumb = ?",name,ordernum] == NO )
        {
            [fileop close];
            tempsta = FILEDeleError;
            return tempsta;
        }
    }
    
    [fileop close];
    return tempsta;
}


@end
