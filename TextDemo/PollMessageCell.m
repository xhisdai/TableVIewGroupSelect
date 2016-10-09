//
//  PollMessageCell.m
//  ElectricitySteward
//
//  Created by huhaifeng on 15/12/9.
//  Copyright © 2015年 huhaifeng. All rights reserved.
//

#import "PollMessageCell.h"

@implementation PollMessageCell

- (UILabel *)label{
    if (_label ==nil) {
        _label =[[UILabel alloc]init];
        _label.frame =CGRectMake(0, 0, 200, 30);
        _label.textColor =[UIColor blueColor];
        _label.font =[UIFont systemFontOfSize:12];
    }
    return _label;
}

- (UIButton *)button{
    if (_button ==nil) {
        _button =[[UIButton alloc]init];
        _button.frame =CGRectMake(230, 0, 40, 40);
        [_button addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self addSubview:self.label];
    [self addSubview:self.button];
    
}

- (void)CellFroData:(PollMessageModel *)model button:(NSInteger)btnTag block:(void(^)(UIButton *btn))ButtonClickBlock{
    
    self.block =ButtonClickBlock;
    
    self.label.text =model.title;
    
    UIImage *image =[model.imgBool intValue]?[UIImage imageNamed:@"pollMess_on"]:[UIImage imageNamed:@"pollMess_off"];
    self.button.tag =btnTag;
    [self.button setImage:image forState:UIControlStateNormal];
}

- (void)ButtonClick:(id)sender {
    if (self.block) {
        
        self.block(sender);
    }
}
@end
