//
//  PollMessageController.m
//  ElectricitySteward
//
//  Created by huhaifeng on 15/12/9.
//  Copyright © 2015年 huhaifeng. All rights reserved.
//
//屏幕宽度
#define SCREEN_W           [UIScreen mainScreen].bounds.size.width

//屏幕高度
#define SCREEN_H           [UIScreen mainScreen].bounds.size.height
#import "PollMessageController.h"
#import "PollMessageGroup.h"
#import "PollMessageGroup.h"
#import "PollMessageModel.h"

@interface PollMessageController()
{
    UIButton * _AllSelectBtn;
}
@end

@implementation PollMessageController

-(void)viewDidAppear:(BOOL)animated{

}

- (PollMessageTableView *)tableView{
    if (_tableView ==nil) {
        _tableView =[[PollMessageTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H-40)];
        _tableView.pollTableDelegate =self;
    }
    return _tableView;
}

-(void)viewDidLoad{
    
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    [self getPollMessTableViewData];
    
    UIButton * allSelectBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    allSelectBtn.selected =NO;    //默认为未选中  
    allSelectBtn.frame =CGRectMake(0, SCREEN_H -40, SCREEN_W, 40);
    allSelectBtn.titleLabel.font =[UIFont systemFontOfSize:17];
    allSelectBtn.backgroundColor =[UIColor grayColor];
    [allSelectBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [allSelectBtn setTitle:@"全选" forState:UIControlStateNormal];
    [allSelectBtn setImage:[UIImage imageNamed:@"pollMess_off"] forState:UIControlStateNormal];
    [allSelectBtn addTarget:self action:@selector(AllSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:allSelectBtn];
    _AllSelectBtn =allSelectBtn;
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
    
    _tableView.arrayData =dataArray;

}

- (void)CellClickAllSelectStatus{
    
    BOOL isAllSelect =NO;//默认不全选
    for(PollMessageGroup * group in _tableView.arrayData)
    {
        if (group.isOK ==NO) {
            isAllSelect =NO; //用户没有全选
            break;
        }
        isAllSelect =YES; //用户全选
    }
    //判断isok 改变全选按钮状态
    _AllSelectBtn.selected =isAllSelect;
    
    if (_AllSelectBtn.selected) {
        //亮图片
        [_AllSelectBtn setImage:[UIImage imageNamed:@"pollMess_on"] forState:UIControlStateNormal];
    }
    
    else
    {
        //不亮图片
        [_AllSelectBtn setImage:[UIImage imageNamed:@"pollMess_off"] forState:UIControlStateNormal];
    }
}

#pragma mark --点击全选按钮--
- (void)AllSelect:(UIButton *)sender{

    sender.selected =!sender.selected;
    
    for(PollMessageGroup * group in _tableView.arrayData){
        group.isOK =sender.selected;
        for(PollMessageModel * model in group.PollMessArrays)
        {
            if (sender.selected ==YES) {
                 model.imgBool =@1;
            }
            else
            {
                 model.imgBool =@0;
            }
           
        }
    }
    
    if (sender.selected) {
        //亮图片
        [sender setImage:[UIImage imageNamed:@"pollMess_on"] forState:UIControlStateNormal];
    }
    
    else
    {
        //不亮图片
        [sender setImage:[UIImage imageNamed:@"pollMess_off"] forState:UIControlStateNormal];
    }
    
    [_tableView reloadData];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"约束即将布局完成===== \n");
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"约束已经布局完成===== \n");
}

- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
    [super willTransitionToTraitCollection:newCollection
                 withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context) {
        if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
            NSLog(@"横屏===== \n");
        } else {
            NSLog(@"竖屏===== \n");
        }
        [self.view setNeedsLayout];
    } completion:nil];
}












@end
