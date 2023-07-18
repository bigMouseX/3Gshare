//
//  SelfHeadTableViewCell.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelfHeadTableViewCell : UITableViewCell
@property(nonatomic, retain)UIImageView *pictureView;
@property(nonatomic, retain)UILabel *labelFirst;
@property(nonatomic, retain)UILabel *labelSecond;
@property(nonatomic, retain)UILabel *labelThird;
@property(nonatomic, retain)UILabel *titleLabel;
@property (nonatomic, strong)UIButton *btn1;
@property (nonatomic, strong)UIButton *btn2;
@property (nonatomic, strong)UIButton *btn3;
@end

NS_ASSUME_NONNULL_END
