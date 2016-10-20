//
//  CarModel.h
//  CarShow
//
//  Created by MichaelLi on 2016/10/20.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarModel : NSObject
//定义属性
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *desc;
@property(nonatomic,strong) NSArray *cars;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)carModelWithDict:(NSDictionary *)dict;
@end
