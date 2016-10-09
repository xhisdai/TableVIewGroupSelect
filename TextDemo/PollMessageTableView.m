//
//  PollMessageTableView.m
//  ElectricitySteward
//
//  Created by huhaifeng on 15/12/9.
//  Copyright © 2015年 huhaifeng. All rights reserved.
//

#import "PollMessageTableView.h"
#import "PollMessageCell.h"
#import "PollMessageModel.h"
#import "PollMessageGroup.h"
#import "PollMessageHeaderView.h"
#import "PollMessageGroup.h"

#import "PollMessageHeaderView.h"
@interface PollMessageTableView()<UITableViewDataSource,UITableViewDelegate,PollMessageHeaderDelegate>
{
    NSMutableArray *_arrayData;
}
@end

@implementation PollMessageTableView
@synthesize arrayData =_arrayData;

- (instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self creatUIView];
}

-(void)creatUIView{

    self.delegate =self;
    self.dataSource =self;
    self.separatorStyle =UITableViewCellSeparatorStyleSingleLine;
    self.backgroundColor =[UIColor whiteColor];

}

#pragma mark --PollMessageHeaderDelegate
-(void)ClickHeaderViewButton{
    [self reloadData];
}

-(void)setArrayData:(NSMutableArray *)arrayData{
    _arrayData =arrayData;
    [self reloadData];
}

/************************************ 代理事件部分 ************************************/
#pragma mark - 表视图代理(设置行数)
//返回每组个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    PollMessageGroup *group =_arrayData[section];
    NSInteger count = group.isOpened ? group.PollMessArrays.count : 0;
    return count;
}
//返回组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [_arrayData count];
}

#pragma mark - 表视图代理(创建数据行)
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellId =@"PollMessage";
    
    __weak __typeof(self)weakSelf =self;
    
    PollMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil){
        cell = [[PollMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    PollMessageGroup *group =_arrayData[indexPath.section];
    PollMessageModel *model =group.PollMessArrays[indexPath.row];
    NSInteger btnTag =indexPath.section *1000 +indexPath.row;
    [cell CellFroData:model button:btnTag block:^(UIButton *btn) {
        [weakSelf cellButtonBlock:btn];
    }];
    
    return cell;
}

-(void)cellButtonBlock:(UIButton *)sender{
    
    NSInteger sec =sender.tag /1000;
    NSInteger index =sender.tag %1000;
    PollMessageGroup *group =_arrayData[sec];
    PollMessageModel *model =group.PollMessArrays[index];
    if ([model.imgBool intValue]==1) {
        model.imgBool =@0;
    }
    else
    {
        model.imgBool =@1;
    }
    [self reloadSections:[[NSIndexSet alloc]initWithIndex:sec] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor =[UIColor whiteColor];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    [tableView  deselectRowAtIndexPath:indexPath animated:NO];
    
    PollMessageGroup *group =_arrayData[indexPath.section];
    PollMessageModel *model =group.PollMessArrays[indexPath.row];
    
    if ([self.pollTableDelegate respondsToSelector:@selector(CellClickToTitle:)]) {
        [self.pollTableDelegate CellClickToTitle:model.title];
    }
}

//定义header
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    PollMessageHeaderView *headerView =[PollMessageHeaderView createHeaderViewForTableView:tableView sect:section];
    headerView.pollMessageDelegate =self;
    PollMessageGroup *group =_arrayData[section];
    headerView.pollMessGroup =group;
    headerView.titleName =group.titleName;
    return headerView;
}

//返回header 高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 36;
}

//返回cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

@end
