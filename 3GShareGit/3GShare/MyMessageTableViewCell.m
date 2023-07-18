//
//  serviceTableViewCell.m
//  WangYiYunApp
//
//  Created by 夏楠 on 2023/6/6.
//

#import "MyMessageTableViewCell.h"
#define newColor [UIColor colorWithRed:50.0 / 255.0 green:142.0 / 255.0 blue:220.0 / 255.0 alpha:1.0]     //自定义颜色

@implementation MyMessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"mymessage"]) {
        self.icon = [[UIImageView alloc] init];
        [self.contentView addSubview:self.icon];
        
        self.name = [[UILabel alloc] init];
        [self.contentView addSubview:self.name];
        
        self.btn = [[UIButton alloc] init];
        UIImage *image = [UIImage imageNamed:@"selfL.png"];
        [_btn setImage:image forState:UIControlStateNormal];
        [self.contentView addSubview:self.btn];
    }
    return self;
}

- (void)layoutSubviews {
    self.name.frame = CGRectMake(50, 0, 200, 40);
    self.icon.frame = CGRectMake(15, 20, 20, 20);
    self.btn.frame = CGRectMake(UIScreen.mainScreen.bounds.size.width - 100, 10, 40, 20);
    [self.btn setTitleColor:newColor forState:UIControlStateNormal];
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
