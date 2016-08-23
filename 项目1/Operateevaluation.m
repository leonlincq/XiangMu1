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

-(FILESTATUS)selectEvaluationByWho:(NSString*)buyer andWare:(NSString*)warename andSaler:(NSString*)saler andSaveArray:(NSMutableArray**)array
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
    
    if (buyer == nil && warename == nil && saler == nil)    //全选
    {
        fileresult = [fileop executeQuery:@"SELECT evaluationBySaler,evaluationByWare,evaluationByBuyer,evaluationByLevel,evaluationByPoint From Evaluation"];
    }
    else if (buyer == nil && warename != nil && saler != nil)
    {
        fileresult = [fileop executeQuery:@"SELECT evaluationBySaler,evaluationByWare,evaluationByBuyer,evaluationByLevel,evaluationByPoint From Evaluation where evaluationByWare = ? and evaluationBySaler = ?",warename,saler];
    }
    else if (buyer != nil && warename == nil && saler == nil)
    {
        fileresult = [fileop executeQuery:@"SELECT evaluationBySaler,evaluationByWare,evaluationByBuyer,evaluationByLevel,evaluationByPoint From Evaluation where evaluationByBuyer = ?",buyer];
    }
    
    
    while ([fileresult next])
    {
        Manageevaluation *temp_date = [[Manageevaluation alloc]init];
        
        temp_date.evaluationBySaler = [fileresult stringForColumn:@"evaluationBySaler"];
        temp_date.evaluationByWare  = [fileresult stringForColumn:@"evaluationByWare"];
        temp_date.evaluationByBuyer = [fileresult stringForColumn:@"evaluationByBuyer"];
        temp_date.evaluationByLevel = [fileresult stringForColumn:@"evaluationByLevel"];
        temp_date.evaluationByPoint = [fileresult stringForColumn:@"evaluationByPoint"];
        
        [dataarray addObject:temp_date];
    };
    
    *array = dataarray;
    
    [fileop close];
    return tempsta;
    
}

@end
