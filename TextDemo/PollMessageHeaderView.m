//
//  PollMessageHeaderView.m
//  ElectricitySteward
//
//  Created by huhaifeng on 15/12/9.
//  Copyright © 2015年 huhaifeng. All rights reserved.
//

#import "PollMessageHeaderView.h"
#import "PollMessageGroup.h"
#import "PollMessageModel.h"
@interface PollMessageHeaderView()
{
    
}
@end

@implementation PollMessageHeaderView

+(instancetype)createHeaderViewForTableView:(UITableView *)tableView sect:(NSInteger)section{
    
    static NSString *headIdentifier = @"header";
    PollMessageHeaderView * headerView =nil;
//    PollMessageHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:headIdentifier];不重用
    if (headerView == nil) {
        headerView = [[PollMessageHeaderView alloc] initWithReuseIdentifier:headIdentifier sect:section];
    }
    return headerView;
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier sect:(NSInteger)section
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        UIButton *bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [bgButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [bgButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        [bgButton setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [bgButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        bgButton.imageView.contentMode = UIViewContentModeCenter;
        bgButton.imageView.clipsToBounds = NO;
        bgButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        bgButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        bgButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [bgButton addTarget:self action:@selector(headBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bgButton];
        bgButton.tag =section;
        _backGroundBtn =bgButton;
        
        UIButton * btn =[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"pollMess_off"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(SelectGroupBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        btn.tag =section * 1000;
        _selectGroundBtn =btn;
        
    }
    
    return self;
}

- (void)setPollMessGroup:(PollMessageGroup *)pollMessGroup{
    _pollMessGroup =pollMessGroup;
    [_backGroundBtn setTitle:_pollMessGroup.titleName forState:UIControlStateNormal];
    
    if (_pollMessGroup.isOK) {
        
        [_selectGroundBtn setImage:[UIImage imageNamed:@"pollMess_on"] forState:UIControlStateNormal];
    }
    else
    {
        [_selectGroundBtn setImage:[UIImage imageNamed:@"pollMess_off"] forState:UIControlStateNormal];
    }
    _selectGroundBtn.selected =_pollMessGroup.isOK;
}

- (void)SelectGroupBtnClick:(UIButton *)sender{
    sender.selected =!sender.selected;
    _pollMessGroup.isOK =sender.selected;
    
    for(PollMessageModel * model in _pollMessGroup.PollMessArrays)
    {
        if (_pollMessGroup.isOK ==YES) {
            model.imgBool =@1;
        }
        else
        {
            model.imgBool =@0;
        }
        
    }
    if ([_pollMessageDelegate respondsToSelector:@selector(ClickSelectGroupButton:)]) {
        [_pollMessageDelegate ClickSelectGroupButton:_selectGroundBtn];
    }
    
}

- (void)headBtnClick:(UIButton *)sender{
    
    _pollMessGroup.opened = !_pollMessGroup.isOpened;
    
    if ([_pollMessageDelegate respondsToSelector:@selector(ClickHeaderViewButton)]) {
        [_pollMessageDelegate ClickHeaderViewButton];
    }
    
}

-(void)layoutSubviews{
    
    _backGroundBtn.frame =self.bounds;
    CGFloat clickWidth =self.bounds.size.height-8;
    _selectGroundBtn.frame =CGRectMake(self.bounds.size.width -clickWidth-5, 4, clickWidth, clickWidth);
}

-(void)didMoveToSuperview{
    
    _backGroundBtn.imageView.transform = _pollMessGroup.isOpened ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformMakeRotation(0);
}

@end
