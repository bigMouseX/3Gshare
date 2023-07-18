//
//  BasicTableViewCell.h
//  ZARA
//
//  Created by 夏楠 on 2023/6/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BasicTableViewCell : UITableViewCell
@property(nonatomic, strong)UILabel *message1;
@property(nonatomic, strong)UILabel *message2;
@property(nonatomic, strong)UILabel *headMessage;
@property(nonatomic, strong)UIImageView *head;
@property(nonatomic, retain)UIButton *btn1;
@property(nonatomic, retain)UIButton *btn2;
@end

NS_ASSUME_NONNULL_END
