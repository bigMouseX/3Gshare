//
//  GuanzhuTableViewCell.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/17.
//

#import "GuanzhuTableViewCell.h"
#define newColor [UIColor colorWithRed:50.0 / 255.0 green:142.0 / 255.0 blue:220.0 / 255.0 alpha:1.0]     //自定义颜色
@implementation GuanzhuTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"guanzhu"]) {
        self.icon = [[UIImageView alloc] init];
        [self.contentView addSubview:self.icon];
        
        self.name = [[UILabel alloc] init];
        [self.contentView addSubview:self.name];
        
        //这里又一点需要注意，在tableviewcell中无法实现圆角，要将圆角设置在视图控制器中才行
        self.btn = [[UIButton alloc] init];
        self.btn.tag = 1005;
        self.btn.layer.cornerRadius = self.btn.bounds.size.width / 2.0;
        self.btn.layer.masksToBounds = YES;
        self.btn.layer.borderWidth = 2.0;
        self.btn.layer.borderColor = newColor.CGColor;
        [self.btn setTitle:@"+关注" forState:UIControlStateNormal];
        [self.btn setTitleColor:newColor forState:UIControlStateNormal];
        [self.btn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.btn];

    }
    return self;
}

- (void)layoutSubviews {
    self.name.frame = CGRectMake(90 + 30, 20, 200, 40);
    self.icon.frame = CGRectMake(15 + 30, 10, 60, 60);
    self.btn.frame = CGRectMake(UIScreen.mainScreen.bounds.size.width - 100, 20, 80, 40);
    [self.btn setTitleColor:newColor forState:UIControlStateNormal];
}

- (void)press:(UIButton *)btn {
    if (_btn.tag == 1005) {
        [_btn setTitle:@"已关注" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _btn.layer.borderColor = [UIColor grayColor].CGColor;
        _btn.tag++;
    } else {
        _btn.layer.borderColor = newColor.CGColor;
        [_btn setTitle:@"+关注" forState:UIControlStateNormal];
        [_btn setTitleColor:newColor forState:UIControlStateNormal];
        _btn.tag--;
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
/*
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
         self.btn.tag = 1005;
         _btn.layer.cornerRadius = _btn.bounds.size.height / 1.3;
         _btn.layer.masksToBounds = YES;
         _btn.clipsToBounds = YES;
         _btn.layer.borderWidth = 1.0;
         _btn.layer.borderColor = newColor.CGColor;
         [_btn setTitle:@"+关注" forState:UIControlStateNormal];
         [_btn setTitleColor:newColor forState:UIControlStateNormal];
         [self.btn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
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

 - (void)press:(UIButton *)btn {
     if (_btn.tag == 1005) {
         [_btn setTitle:@"已关注" forState:UIControlStateNormal];
         [_btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
         _btn.layer.borderColor = [UIColor grayColor].CGColor;
         _btn.tag++;
     } else {
         _btn.layer.borderColor = newColor.CGColor;
         [_btn setTitle:@"+关注" forState:UIControlStateNormal];
         [_btn setTitleColor:newColor forState:UIControlStateNormal];
         _btn.tag--;
     }
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

 */

@end
