//
//  PhotoWallViewController.h
//  WangYiYunApp
//
//  Created by 夏楠 on 2023/6/13.
//

#import <UIKit/UIKit.h>
@protocol photoWallDelegate <NSObject>

- (void)changePhoto:(UIImage *)image count:(long)a;

@end
NS_ASSUME_NONNULL_BEGIN

@interface PhotoWallViewController : UIViewController
@property(nonatomic, assign)int photoNums;
@property (retain, nonatomic)UIAlertController *alert;

//定义一个代理对象
//代理对象会执行协议函数
//通过代理对象实现协议函数，达到代理对象改变本身属性的目的
//代理对象一定要实现代理协议
@property(assign, nonatomic)id<photoWallDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
