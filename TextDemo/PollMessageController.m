//
//  PollMessageController.m
//  ElectricitySteward
//
//  Created by huhaifeng on 15/12/9.
//  Copyright © 2015年 huhaifeng. All rights reserved.
//

#import "PollMessageController.h"
#import "PollMessageGroup.h"


#import "PollMessageGroup.h"
#import "PollMessageModel.h"
@implementation PollMessageController

-(void)viewDidAppear:(BOOL)animated{

}

- (PollMessageTableView *)table_view{
    if (_table_view ==nil) {
        _table_view =[[PollMessageTableView alloc]initWithFrame:CGRectMake(0, 0, 320, 504)];
        _table_view.pollTableDelegate =self;
    }
    return _table_view;
}

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self.view addSubview:self.table_view];
    
    [self getPollMessTableViewData];
    
    
}


- (void)getPollMessTableViewData{
    NSMutableArray * array =[NSMutableArray new];
    
    NSDictionary * dic =@{@"title":@"ABCDE",@"data":[NSMutableArray arrayWithArray:@[
                                                    
                                                     @{@"title":@"abcde0",@"content":@"content",@"id":@"1"},
                                                     @{@"title":@"abcde1",@"content":@"content",@"id":@"1"},
                                                     @{@"title":@"abcde2",@"content":@"content",@"id":@"1"}
                                                     ]]};
    for (int i =0; i<11; i++) {
        [array addObject:dic];
    }
    
    NSMutableArray *dataArray =[NSMutableArray new];
    for(NSDictionary *dic in array){
        
        PollMessageGroup *group =[PollMessageGroup PollMessWithDict:dic];
        [dataArray addObject:group];
    }
    
    _table_view.arrayData =dataArray;


}

- (IBAction)PushBtnClick:(id)sender {
    
    
}

- (IBAction)AddDefactBtnClick:(id)sender {

}

#pragma mark --tableDelegate
-(void)CellClickToTitle:(NSString *)string{

}

@end
