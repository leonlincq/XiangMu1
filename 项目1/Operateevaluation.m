//
//  Operatecollect.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Operateevaluation.h"

@implementation Operateevaluation

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
-(FILESTATUS)creatTableForEvaluation
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if ([fileop executeUpdate:@"CREATE TABLE IF NOT EXISTS Evaluation (evaluationBySaler TEXT,evaluationByWare TEXT,evaluationByBuyer TEXT,evaluationByLevel TEXT ,evaluationByPoint TEXT)"] == NO)
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
-(FILESTATUS)addEvaluation:(Manageevaluation *)evaluationdata
{
    FILESTATUS tempsta = FILEYES;
    FMDatabase *fileop = [FMDatabase databaseWithPath:[self filepath]];
    
    if ([fileop open] == NO )
    {
        tempsta = FILEOpenError;
        return tempsta;
    }
    
    if ([fileop executeUpdate:@"INSERT INTO Evaluation(evaluationBySaler,evaluationByWare,evaluationByBuyer,evaluationByLevel,evaluationByPoint) VALUES (?,?,?,?,?)",evaluationdata.evaluationBySaler,evaluationdata.evaluationByWare,evaluationdata.evaluationByBuyer,evaluationdata.evaluationByLevel,evaluationdata.evaluationByPoint] == NO )
    {
        [fileop close];
        tempsta = FILEAddError;
        return tempsta;
    }
    
    [fileop close];
    return tempsta;
}

@end
