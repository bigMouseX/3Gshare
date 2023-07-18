//
//  SetViewController.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/18.
//

#import <UIKit/UIKit.h>
#import "GuanzhuViewController.h"
#import "XiaoxiSetViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface SetViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *arrayData;
@property (retain, nonatomic)UIAlertController *alert;
@property (nonatomic, strong) XiaoxiSetViewController *guanzhu;

@end

NS_ASSUME_NONNULL_END
