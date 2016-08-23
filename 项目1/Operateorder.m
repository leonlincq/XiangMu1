//
//  Operateorder.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Operateorder.h"

@implementation Operateorder

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
-(FILESTATUS)creatTableForOrder
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if ([fileop executeUpdate:@"CREATE TABLE IF NOT EXISTS Orders (orderbuyer TEXT REFERENCES UserDatas('name') ON DELETE CASCADE ON UPDATE CASCADE,ordernumb INTEGER,ordersta TEXT,orderware TEXT REFERENCES Ware('warename') ON DELETE CASCADE ON UPDATE CASCADE,ordersaler TEXT REFERENCES UserDatas('name') ON DELETE CASCADE ON UPDATE CASCADE,ordermoney INTEGER,orderquantity INTEGER,orderallmoney INTEGER,orderaddress TEXT)"] == NO)
    {
        [fileop close];
        tempsta = FILEBuildError;
        return tempsta;
    }
    
    [fileop close];
    return tempsta;
}

//=====================================================
//  描述:在选定表格添加订单信息()
//  输入:orderdata:添加的新的订单信息
//  返回:错误代码
//=====================================================
-(FILESTATUS)addOrder:(Manageorder *)orderdata
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if ([fileop executeUpdate:@"INSERT INTO Orders(orderbuyer,ordernumb,ordersta,orderware,ordersaler,ordermoney,orderquantity,orderallmoney,orderaddress) VALUES (?,?,?,?,?,?,?,?,?)",orderdata.orderbuyer,[NSNumber numberWithInteger:orderdata.ordernumb],orderdata.ordersta,orderdata.orderware,orderdata.ordersaler,[NSNumber numberWithInteger:orderdata.ordermoney],[NSNumber numberWithInteger:orderdata.orderquantity],[NSNumber numberWithInteger:orderdata.orderallmoney],orderdata.orderaddress] == NO )
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
-(FILESTATUS)selectOrderByWho:(NSString*)name andOrderSta:(NSString*)sta andOrdernumb:(NSInteger)numb andSaler:(NSString*)saler andSaveArray:(NSMutableArray**)array
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
    
    if (name == nil && sta == nil && numb == 0 && saler == nil)
    {
        fileresult = [fileop executeQuery:@"SELECT orderbuyer,ordernumb,ordersta,orderware,ordersaler,ordermoney,orderquantity,orderallmoney,orderaddress From Orders"];
    }
    else if (name != nil && sta == nil && numb == 0 && saler == nil)
    {
        fileresult = [fileop executeQuery:@"SELECT orderbuyer,ordernumb,ordersta,orderware,ordersaler,ordermoney,orderquantity,orderallmoney,orderaddress From Orders where orderbuyer = ?",name];
    }
    else if (name != nil && sta != nil && numb == 0 && saler == nil)
    {
        fileresult = [fileop executeQuery:@"SELECT orderbuyer,ordernumb,ordersta,orderware,ordersaler,ordermoney,orderquantity,orderallmoney,orderaddress From Orders where orderbuyer = ? and ordersta = ?",name,sta];
    }
    else if (name == nil && sta == nil && numb != 0 && saler == nil)
    {
        fileresult = [fileop executeQuery:@"SELECT orderbuyer,ordernumb,ordersta,orderware,ordersaler,ordermoney,orderquantity,orderallmoney,orderaddress From Orders where ordernumb = ?",[NSNumber numberWithInteger:numb]];
    }
    else if (name == nil && sta != nil && numb == 0 && saler != nil)
    {
        fileresult = [fileop executeQuery:@"SELECT orderbuyer,ordernumb,ordersta,orderware,ordersaler,ordermoney,orderquantity,orderallmoney,orderaddress From Orders where ordersta = ? and ordersaler = ?",sta,saler];
    }
    
    
    
    while ([fileresult next])
    {
        Manageorder *temp_date = [[Manageorder alloc]init];
        
        temp_date.orderbuyer    = [fileresult stringForColumn:@"orderbuyer"];
        temp_date.ordernumb     = [fileresult intForColumn:@"ordernumb"];
        temp_date.ordersta      = [fileresult stringForColumn:@"ordersta"];
        temp_date.orderware     = [fileresult stringForColumn:@"orderware"];
        temp_date.ordersaler    = [fileresult stringForColumn:@"ordersaler"];
        temp_date.ordermoney    = [fileresult intForColumn:@"ordermoney"];
        temp_date.orderquantity = [fileresult intForColumn:@"orderquantity"];
        temp_date.orderallmoney = [fileresult intForColumn:@"orderallmoney"];
        temp_date.orderaddress  = [fileresult stringForColumn:@"orderaddress"];

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
-(FILESTATUS)deletOrderByWho:(NSString *)name
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
        if ([fileop executeUpdate:@"DELETE FROM Orders"] == NO )
        {
            [fileop close];
            tempsta = FILEDeleError;
            return tempsta;
        }
    }
    else
    {
        if ([fileop executeUpdate:@"DELETE FROM Orders WHERE orderbuyer = ?",name] == NO )
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
//  描述:更新订单信息
//  输入:orderdata:选择的用户订单信息
//  返回:错误代码
//=====================================================
-(FILESTATUS)upOrderData:(Manageorder *)orderdata withStatu:(LCQChooseUpOrderdata)statu
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
            
        case LCQChooseUpOrderdata_ordersta:
            if ([fileop executeUpdate:@"UPDATE Orders SET ordersta = ? where orderware = ? and orderbuyer = ? and ordernumb = ?",orderdata.ordersta,orderdata.orderware,orderdata.orderbuyer,[NSNumber numberWithInteger:orderdata.ordernumb]] == NO )
            {
                [fileop close];
                tempsta = FILEUpDataError;
                return tempsta;
            }
            break;
            
        case LCQChooseUpOrderdata_ordernumb:
            if ([fileop executeUpdate:@"UPDATE Orders SET ordernumb = ? where orderware = ? and ordernumb = ?",[NSNumber numberWithInteger:orderdata.ordernumb],orderdata.orderware,[NSNumber numberWithInteger:orderdata.ordernumb]] == NO )
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

//=====================================================
//  描述:查找有多少订单
//  输入:buyer:身为买家   sta:订单状态    saler：身为卖家
//  返回:错误代码
//=====================================================
-(NSInteger)searchOrderByBuyer:(NSString*)buyer andOrderSta:(NSString*)sta andSaler:(NSString*)saler andKeyToErgodic:(BOOL)key
{
    Manageorder *neworder = [[Manageorder alloc]init];
    
    NSMutableArray *dataarray = [[NSMutableArray alloc]init];
    
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    [fileop open];

    FMResultSet *fileresult;
    
    if (buyer != nil && sta != nil && saler == nil)
    {
        fileresult = [fileop executeQuery:@"SELECT orderbuyer,ordernumb,ordersta,orderware,ordersaler,ordermoney,orderquantity,orderallmoney,orderaddress From Orders where orderbuyer = ? and ordersta = ?",buyer,sta];
    }
    else if (buyer == nil && sta != nil && saler != nil)
    {
        fileresult = [fileop executeQuery:@"SELECT orderbuyer,ordernumb,ordersta,orderware,ordersaler,ordermoney,orderquantity,orderallmoney,orderaddress From Orders where ordersta = ? and ordersaler = ?",sta,saler];
    }

    while ([fileresult next])
    {
        Manageorder *temp_date = [[Manageorder alloc]init];
        
        temp_date.orderbuyer    = [fileresult stringForColumn:@"orderbuyer"];
        temp_date.ordernumb     = [fileresult intForColumn:@"ordernumb"];
        temp_date.ordersta      = [fileresult stringForColumn:@"ordersta"];
        temp_date.orderware     = [fileresult stringForColumn:@"orderware"];
        temp_date.ordersaler    = [fileresult stringForColumn:@"ordersaler"];
        temp_date.ordermoney    = [fileresult intForColumn:@"ordermoney"];
        temp_date.orderquantity = [fileresult intForColumn:@"orderquantity"];
        temp_date.orderallmoney = [fileresult intForColumn:@"orderallmoney"];
        temp_date.orderaddress  = [fileresult stringForColumn:@"orderaddress"];
        
        [dataarray addObject:temp_date];
    };
    
    [fileop close];
    
    
    if (key == YES )
    {
        if (dataarray.count != 0)
        {
            printf("✅此类订单信息如下：\n");
            for (NSInteger count_i = 0; count_i < dataarray.count; count_i++)
            {
                printf("(%ld)->",count_i+1);
                neworder = [dataarray[count_i] copy];
                [neworder printfAllData];
                printf("---------\n");
            }
        }
        else
        {
            printf("✅暂无此类订单\n");
        }
    }
 
    return dataarray.count;
}


@end
