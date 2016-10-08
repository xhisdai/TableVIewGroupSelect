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
        
        UIImageView *image =[[UIImageView alloc]init];
        [self addSubview:image];
        image.tag =100 +section;
        _clickImage =image;
        
    }
    
    return self;
}

- (void)headBtnClick:(UIButton *)sender{
    
    _pollMessGroup.opened = !_pollMessGroup.isOpened;
    
    if ([_pollMessageDelegate respondsToSelector:@selector(ClickHeaderViewButton)]) {
        [_pollMessageDelegate ClickHeaderViewButton];
    }
    
}

-(void)setTitleName:(NSString *)titleName{
    _titleName =titleName;
    [_backGroundBtn setTitle:titleName forState:UIControlStateNormal];
    [_clickImage setImage:[UIImage imageNamed:@"pollMess_on"]];
    for(PollMessageModel *model in _pollMessGroup.PollMessArrays){
        
        if ([model.imgBool intValue] !=1) {
            [_clickImage setImage:[UIImage imageNamed:@"pollMess_off"]];
            break;
        }
    }
}

-(void)layoutSubviews{
    
    _backGroundBtn.frame =self.bounds;
    CGFloat clickWidth =self.bounds.size.height-8;
    _clickImage.frame =CGRectMake(self.bounds.size.width -clickWidth-5, 4, clickWidth, clickWidth);
}

-(void)didMoveToSuperview{
    
    _backGroundBtn.imageView.transform = _pollMessGroup.isOpened ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformMakeRotation(0);
}

@end
