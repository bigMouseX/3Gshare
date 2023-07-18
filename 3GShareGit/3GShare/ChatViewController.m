//
//  ChatViewController.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/17.
//

#import "ChatViewController.h"
#import "ChatRightTableViewCell.h"
#import "ChatLeftTableViewCell.h"
#define wechatBackgroundColor [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0]
#define newColor [UIColor colorWithRed:50.0 / 255.0 green:142.0 / 255.0 blue:220.0 / 255.0 alpha:1.0]
@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = wechatBackgroundColor;
    _arryleftsizewidh = [[NSMutableArray alloc]init];
    _arryrightsizewidh = [[NSMutableArray alloc]init];
    _arryleftsizeheight = [[NSMutableArray alloc]init];
    _arryrightsizeheight = [[NSMutableArray alloc]init];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 65) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _shuruTextField.delegate = self;
    _shuruTextField = [[UITextField alloc]initWithFrame:CGRectMake(30, self.view.frame.size.height - 65, 290, 40)];
    [self.view addSubview:_shuruTextField];
    _shuruTextField.backgroundColor = [UIColor whiteColor];
    UIButton *sendButton = [[UIButton alloc]initWithFrame:CGRectMake(325, self.view.frame.size.height - 65, 60, 40)];
    [sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [sendButton setTintColor:newColor];
    sendButton.backgroundColor = newColor;
    [self.view addSubview:_tableView];
    [self.view addSubview:sendButton];
    _arryright = [[NSMutableArray alloc]initWithObjects:@"你拍的真不错",@"好专业的照片，非常喜欢这种风格，期待你更好的作品", nil];
     _arryM = [[NSMutableArray alloc]initWithObjects:@"谢谢，已关注你",@"嗯嗯，好的", nil];
      _arryleftsizewidh = [[NSMutableArray alloc]init];
     _arryrightsizewidh = [[NSMutableArray alloc]init];
     _arryleftsizeheight = [[NSMutableArray alloc]init];
     _arryrightsizeheight = [[NSMutableArray alloc]init];
     for (NSString * str in _arryright) {
         CGSize sizeright = [self size:str font:[UIFont systemFontOfSize:14.0] maxSize:CGSizeMake(375/2-70 , MAXFLOAT)];
         
         NSNumber *num = [NSNumber numberWithFloat:sizeright.width];
         NSNumber *num1 = [NSNumber numberWithFloat:sizeright.height];
         [_arryrightsizeheight addObject:num1];
         [_arryrightsizewidh addObject:num];
     }
     for (NSString * str in _arryM) {
         CGSize sizeleft = [self size:str font:[UIFont systemFontOfSize:14.0] maxSize:CGSizeMake(372/2-70, MAXFLOAT)];
         NSNumber *num = [NSNumber numberWithFloat:sizeleft.width];
         NSNumber *num1 = [NSNumber numberWithFloat:sizeleft.height];
         [_arryleftsizeheight addObject:num1];
         [_arryleftsizewidh addObject:num];
         _shuruTextField.delegate = self;
     }
       [sendButton addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];//添加点击事件
    
    _tableView.backgroundColor = wechatBackgroundColor;
    self.tabBarController.tabBar.hidden = YES;
    
    //========实现输入框与键盘同时上移动
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    //========实现输入框与键盘同时上移动
    // 自定义导航栏按钮
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setImage:[UIImage imageNamed:@"back_img.png"] forState:UIControlStateNormal];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back addTarget:self action:@selector(pressback) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    // 自定义导航栏按钮

}

- (void)pressback {
    self.tabBarController.tabBar.hidden = NO;

    [self.navigationController popViewControllerAnimated:YES];
}

////========实现输入框与键盘同时上移动
- (void)keyboardWillChangeFrame:(NSNotification *)notification {
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 根据键盘的 Y 坐标位置调整输入框的位置
    CGFloat textFieldMaxY = CGRectGetMaxY(_shuruTextField.frame);
    CGFloat offsetY = textFieldMaxY - keyboardY;
    if (offsetY > 0) {
        [UIView animateWithDuration:duration animations:^{
            CGRect frame = self.view.frame;
            frame.origin.y -= offsetY;
            [UIView animateWithDuration:duration animations:^{
                [self.view setFrame:frame];
            }];
        }];
    } else {
        [UIView animateWithDuration:duration animations:^{
            CGRect frame = self.view.frame;
            frame.origin.y = 0;
            [UIView animateWithDuration:duration animations:^{
                [self.view setFrame:frame];
            }];
        }];
    }
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}
//========实现输入框与键盘同时上移动

-(void)send
 {
     [_arryM addObject:_shuruTextField.text];
     [_arryright addObject:_shuruTextField.text];
     
     CGSize sizeright = [self size:_shuruTextField.text font:[UIFont systemFontOfSize:14.0] maxSize:CGSizeMake(375/2-70 , MAXFLOAT)];
     
     NSNumber *num = [NSNumber numberWithFloat:sizeright.width];
     NSNumber *num1 = [NSNumber numberWithFloat:sizeright.height];
     [_arryrightsizeheight addObject:num1];
     [_arryrightsizewidh addObject:num];


     CGSize sizeleft = [self size:_shuruTextField.text font:[UIFont systemFontOfSize:14.0] maxSize:CGSizeMake(372/2-70, MAXFLOAT)];
     NSNumber *num3 = [NSNumber numberWithFloat:sizeleft.width];
     NSNumber *num4 = [NSNumber numberWithFloat:sizeleft.height];
     [_arryleftsizeheight addObject:num4];
     [_arryleftsizewidh addObject:num3];
 NSLog(@"%@",_arryleftsizeheight[2]);
  NSLog(@"%@",_arryM[2]);
 _shuruTextField.text = @"";
 [_tableView reloadData];
 }

-(CGSize)size:(NSString*)text font:(UIFont*)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName ,nil];
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _arryM.count;//这里返回的section就是数组内存储的个数
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section % 2 == 0) {
        static NSString *ID = @"right";
        ChatRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if(cell==nil)
        {
            cell = [[ChatRightTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        //每一个cell的计算就是从右开始布局然后在右的基础上进行增加高度和宽度
        cell.dateLabel.frame = CGRectMake(120, 10, 200, 10) ;
        NSDate *currentDate = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
        NSString *formattedDate = [formatter stringFromDate:currentDate];
        cell.dateLabel.text = formattedDate;
        cell.dateLabel.textColor = [UIColor blackColor];
        cell.dateLabel.font = [UIFont systemFontOfSize:10];

        
        CGSize textSizeright;
        textSizeright.height =[_arryrightsizeheight[indexPath.section] floatValue];
        textSizeright.width = [_arryrightsizewidh[indexPath.section] floatValue];
        cell.rightTextView.frame = CGRectMake(375/2, 40, textSizeright.width, textSizeright.height);
        
        cell.rightImageView.image = [UIImage imageNamed:@"headPhoto1.jpg"];
        cell.rightImageView.frame = CGRectMake(315, 40, 40, 40);
        cell.rightTextView.text = _arryright[indexPath.section];
        cell.rightTextView.backgroundColor = newColor;
        cell.rightTextView.numberOfLines = 0;
        cell.rightTextView.textAlignment = NSTextAlignmentRight;
        cell.rightTextView.font = [UIFont systemFontOfSize:14.0];

        cell.leftImageView.frame = CGRectMake(10, textSizeright.height+60, 40, 40);
        cell.leftImageView.image = [UIImage imageNamed:@"headPhoto2.jpg"];
        CGSize textSizeleft;
        cell.leftTextView.textAlignment = NSTextAlignmentLeft;
        textSizeleft.height =[_arryleftsizeheight[indexPath.section] floatValue];
        textSizeleft.width = [_arryleftsizewidh[indexPath.section] floatValue];
        cell.leftTextView.text =_arryM[indexPath.section];
        cell.leftTextView.frame =CGRectMake(60, textSizeright.height+60, textSizeleft.width, textSizeleft.height);
        cell.leftTextView.font = [UIFont systemFontOfSize:14.0];
        cell.leftTextView.numberOfLines = 0;
        cell.rightTextView.numberOfLines = 0;
        cell.rightTextView.font = [UIFont systemFontOfSize:14.0];
        cell.leftTextView.backgroundColor = [UIColor whiteColor];
        cell.backgroundColor = wechatBackgroundColor;
        
        if (indexPath.section >= 3) {
            NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.section];
            [tableView scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        }
        return cell;
        
    } else {
        static NSString *ID = @"left";
        ChatLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if(cell==nil)
        {
            cell = [[ChatLeftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        //每一个cell的计算就是从右开始布局然后在右的基础上进行增加高度和宽度
        cell.dateLabel.frame = CGRectMake(120, 10, 200, 10) ;
        NSDate *currentDate = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
        NSString *formattedDate = [formatter stringFromDate:currentDate];
        cell.dateLabel.text = formattedDate;
        cell.dateLabel.textColor = [UIColor blackColor];
        cell.dateLabel.font = [UIFont systemFontOfSize:10];

        
        CGSize textSizeright;
        textSizeright.height =[_arryrightsizeheight[indexPath.section] floatValue];
        textSizeright.width = [_arryrightsizewidh[indexPath.section] floatValue];
        cell.rightTextView.frame = CGRectMake(375/2, 40, textSizeright.width, textSizeright.height);
        
        cell.rightImageView.image = [UIImage imageNamed:@"headPhoto1.jpg"];
        cell.rightImageView.frame = CGRectMake(315, 40, 40, 40);
        cell.rightTextView.text = _arryright[indexPath.section];
        cell.rightTextView.backgroundColor = newColor;
        cell.rightTextView.numberOfLines = 0;
        cell.rightTextView.textAlignment = NSTextAlignmentRight;
        cell.rightTextView.font = [UIFont systemFontOfSize:14.0];

        cell.leftImageView.frame = CGRectMake(10, 40, 40, 40);
        cell.leftImageView.image = [UIImage imageNamed:@"headPhoto2.jpg"];
        CGSize textSizeleft;
        cell.leftTextView.textAlignment = NSTextAlignmentLeft;
        textSizeleft.height =[_arryleftsizeheight[indexPath.section] floatValue];
        textSizeleft.width = [_arryleftsizewidh[indexPath.section] floatValue];
        cell.leftTextView.text =_arryM[indexPath.section];
        cell.leftTextView.frame =CGRectMake(60, 40, textSizeleft.width, textSizeleft.height);
        cell.leftTextView.font = [UIFont systemFontOfSize:14.0];
        cell.leftTextView.numberOfLines = 0;
        cell.rightTextView.numberOfLines = 0;
        cell.rightTextView.font = [UIFont systemFontOfSize:14.0];
        cell.leftTextView.backgroundColor = [UIColor whiteColor];
        cell.backgroundColor = wechatBackgroundColor;
        
        if (indexPath.section >= 4) {
            NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.section];
            [tableView scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        }

        return cell;
    }

    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//每一个单元格的高度计算就是获取存储CGSize数组的高度加上固定行高进行计算
    CGSize right;
  right.height =[_arryrightsizeheight[indexPath.section] floatValue];
    CGSize left;
    left.height =[_arryleftsizeheight[indexPath.section] floatValue];

//    if (indexPath.section > 1)
    return (114);
//    else return (left.height+80);
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}



@end
