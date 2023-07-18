//
//  HuodongTableViewCell.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/17.
//

#import "HuodongTableViewCell.h"

@implementation HuodongTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:@"huodong"];
    
    _label = [[UILabel alloc] init];
    _p = [[UIImageView alloc] init];
    [self.contentView addSubview:_label];
    [self.contentView addSubview:_p];
    return self;
}

- (void)layoutSubviews {
    _p.frame = CGRectMake(5, 0, UIScreen.mainScreen.bounds.size.width - 10, 140);
    _label.frame = CGRectMake(5, 140, UIScreen.mainScreen.bounds.size.width - 10, 10);

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
