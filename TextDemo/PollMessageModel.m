//
//  PollMessageModel.m
//  ElectricitySteward
//
//  Created by huhaifeng on 15/12/9.
//  Copyright © 2015年 huhaifeng. All rights reserved.
//

#import "PollMessageModel.h"

@implementation PollMessageModel

+(PollMessageModel *)initWithDic:(NSDictionary *)dic{
    
    return [[self alloc]initWithModel:dic];
}

-(PollMessageModel *)initWithModel:(NSDictionary *)dic{
    
    if (self = [super init]) {
        
        self.imgBool =[dic objectForKey:@"image"];
        self.title =[dic objectForKey:@"title"];
        self.Id =[dic objectForKey:@"id"];
    }
    return self;
    
}

@end
