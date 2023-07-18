//
//  UpLoadViewController.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/16.
//

#import <UIKit/UIKit.h>
#import "PhotoWallViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface UpLoadViewController : UIViewController<photoWallDelegate, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (nonatomic, strong) UIButton *addPhoto;
@property (nonatomic, strong) UILabel *total;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSMutableArray *dataArray;
@property (nonatomic, copy) NSArray *arrayData;
@property (nonatomic, strong)UIButton *zhedie;
@property (nonatomic, strong) UITextField *textFieldFirst;
@property (nonatomic, strong) UITextField *textFieldSecond;
@property (retain, nonatomic)UIAlertController *alert;

@end

NS_ASSUME_NONNULL_END
