//
//  Operateshopcar.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Operateshopcar.h"

@implementation Operateshopcar

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
-(FILESTATUS)creatTableForShopCar
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if ([fileop executeUpdate:@"CREATE TABLE IF NOT EXISTS ShopCar (shopcarbypeople TEXT REFERENCES UserDatas￼('name') ON DELETE CASCADE ON UPDATE CASCADE, shopcarname TEXT REFERENCES Ware￼('warename') ON DELETE CASCADE ON UPDATE CASCADE,shopcarsaler TEXT REFERENCES UserDatas￼('name') ON DELETE CASCADE ON UPDATE CASCADE,shopcarmoney INTEGER,shopcarquantity INTEGER,shopcarallmoney INTEGER)"] == NO)
    {
        [fileop close];
        tempsta = FILEBuildError;
        return tempsta;
    }
    
    [fileop close];
    return tempsta;
}

//=====================================================
//  描述:在选定表格添加购物信息()
//  输入:shopcardata:添加的新的购物信息
//  返回:错误代码
//=====================================================
-(FILESTATUS)addToShopCar:(Manageshopcar *)shopcardata
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if ([fileop executeUpdate:@"INSERT INTO ShopCar(shopcarbypeople,shopcarname,shopcarsaler,shopcarmoney,shopcarquantity,shopcarallmoney) VALUES (?,?,?,?,?,?)",shopcardata.shopcarbypeople,shopcardata.shopcarname,shopcardata.shopcarsaler,[NSNumber numberWithInteger:shopcardata.shopcarmoney],[NSNumber numberWithInteger:shopcardata.shopcarquantity],[NSNumber numberWithInteger:shopcardata.shopcarallmoney]] == NO )
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
-(FILESTATUS)selectShopCarByWho:(NSString*)buyer andWare:(NSString*)ware andSaveArray:(NSMutableArray**)array
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
    
    if (buyer == nil && ware == nil)
    {
        fileresult = [fileop executeQuery:@"SELECT shopcarbypeople,shopcarname,shopcarsaler,shopcarmoney,shopcarquantity,shopcarallmoney From ShopCar"];
    }
    else if (buyer != nil && ware != nil)
    {
        fileresult = [fileop executeQuery:@"SELECT shopcarbypeople,shopcarname,shopcarsaler,shopcarmoney,shopcarquantity,shopcarallmoney From ShopCar where shopcarbypeople = ? and shopcarname = ?",buyer,ware];
    }
    else if (buyer != nil && ware == nil)
    {
        fileresult = [fileop executeQuery:@"SELECT shopcarbypeople,shopcarname,shopcarsaler,shopcarmoney,shopcarquantity,shopcarallmoney From ShopCar where shopcarbypeople = ?",buyer];
    }
    
    
    
    
    while ([fileresult next])
    {
        Manageshopcar *temp_date = [[Manageshopcar alloc]init];
        
        temp_date.shopcarbypeople   = [fileresult stringForColumn:@"shopcarbypeople"];
        temp_date.shopcarname       = [fileresult stringForColumn:@"shopcarname"];
        temp_date.shopcarsaler      = [fileresult stringForColumn:@"shopcarsaler"];
        temp_date.shopcarmoney      = [fileresult intForColumn:@"shopcarmoney"];
        temp_date.shopcarquantity   = [fileresult intForColumn:@"shopcarquantity"];
        temp_date.shopcarallmoney   = [fileresult intForColumn:@"shopcarallmoney"];
        
        [dataarray addObject:temp_date];
    };
    
    *array = dataarray;
    
    [fileop close];
    return tempsta;
}

//=====================================================
//  描述:删除购物车信息
//  输入:name:选择的用户
//  返回:错误代码
//=====================================================
-(FILESTATUS)deletShopCarByWho:(NSString *)shopcarbuyer andWare:(NSString *)shopcarname
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if (shopcarname == nil)
    {
        if ([fileop executeUpdate:@"DELETE FROM ShopCar"] == NO )
        {
            [fileop close];
            tempsta = FILEDeleError;
            return tempsta;
        }
    }
    else
    {
        if ([fileop executeUpdate:@"DELETE FROM ShopCar WHERE shopcarbypeople = ? and shopcarname = ?",shopcarbuyer,shopcarname] == NO )
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
//  描述:更新购物车信息
//  输入:shopcardata:选择的用户购物车信息
//  返回:错误代码
//=====================================================
-(FILESTATUS)upShopCarData:(Manageshopcar *)shopcardata withStatu:(LCQChooseUpShopCardata)statu
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
            
        case LCQChooseUpShopCardata_shopcarquantity:
            if ([fileop executeUpdate:@"UPDATE ShopCar SET shopcarquantity = ? where shopcarname = ? and shopcarbypeople = ?",[NSNumber numberWithInteger:shopcardata.shopcarquantity],shopcardata.shopcarname,shopcardata.shopcarbypeople] == NO )
            {
                [fileop close];
                tempsta = FILEUpDataError;
                return tempsta;
            }
            break;
            
        case LCQChooseUpShopCardata_shopcarallmoney:
            if ([fileop executeUpdate:@"UPDATE ShopCar SET shopcarallmoney = ? where shopcarname = ? and shopcarbypeople = ?",[NSNumber numberWithInteger:shopcardata.shopcarallmoney],shopcardata.shopcarname,shopcardata.shopcarbypeople] == NO )
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
