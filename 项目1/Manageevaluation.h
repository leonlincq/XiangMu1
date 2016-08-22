//
//  Managecollect.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manageevaluation : NSObject<NSCopying>

#define OneStar     @"OneStar"      //一颗星
#define TwoStar     @"TwoStar"      //二颗星
#define ThreeStar   @"ThreeStar"    //三颗星
#define FourStar    @"FourStar"     //四颗星
#define FiveStar    @"FiveStar"     //五颗星

#define GOOD        @"GOOD"         //好评
#define General     @"General"      //一般
#define Poor        @"Poor"         //差评



@property (nonatomic,copy)      NSString    *evaluationBySaler;     //谁卖的
@property (nonatomic,copy)      NSString    *evaluationByWare;      //谁的商品
@property (nonatomic,copy)      NSString    *evaluationByBuyer;     //谁买的
@property (nonatomic,copy)      NSString    *evaluationByLevel;     //评价级别
@property (nonatomic,copy)      NSString    *evaluationByPoint;     //评价分数

-(void)printfEvaluationBySaler;
-(void)printfEvaluationByWare;
-(void)printfEvaluationByBuyer;
-(void)printfEvaluationByLevel;
-(void)printfEvaluationByPoint;
-(void)printfAllData;
@end
