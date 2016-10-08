//
//  PollMessageHeaderView.h
//  ElectricitySteward
//
//  Created by huhaifeng on 15/12/9.
//  Copyright © 2015年 huhaifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PollMessageGroup;

@protocol PollMessageHeaderDelegate <NSObject>

-(void)ClickHeaderViewButton;

@end

@interface PollMessageHeaderView : UITableViewHeaderFooterView

@property (nonatomic ,strong)id<PollMessageHeaderDelegate> pollMessageDelegate;

@property (nonatomic ,strong)PollMessageGroup *pollMessGroup;
@property (nonatomic ,strong)NSString *titleName;

@property (nonatomic ,strong)UIButton *backGroundBtn;
@property (nonatomic ,strong)UIImageView *clickImage;

+(instancetype)createHeaderViewForTableView:(UITableView *)tableView sect:(NSInteger)section;

@end
