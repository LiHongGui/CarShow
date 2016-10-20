//
//  CarModel.m
//  CarShow
//
//  Created by MichaelLi on 2016/10/20.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel


-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)carModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
