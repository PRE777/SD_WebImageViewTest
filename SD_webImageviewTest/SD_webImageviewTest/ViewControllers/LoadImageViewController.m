//
//  LoadImageViewController.m
//  SD_webImageviewTest
//
//  Created by LW on 2018/8/13.
//  Copyright © 2018年 iWhere. All rights reserved.
//

#import "LoadImageViewController.h"
#import <UIView+WebCache.h>
#import <UIImageView+WebCache.h>
@interface LoadImageViewController ()<SDWebImageManagerDelegate>
@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation LoadImageViewController

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [_imageView sd_cancelCurrentImageLoad];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    [self setupUI];
    
}

-(void)setupUI{
    [_imageView sd_setShowActivityIndicatorView:YES];
    [_imageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20, (SCREEN_WIDTH - 20)*9/16.0)];
    _imageView.backgroundColor = [UIColor greenColor];
    NSURL *url = [NSURL URLWithString:@"http://qiniu.iwhere.com/zntn/e8d33cad5215de45b3ea08cda0ad2f8e.jpg"];
    [_imageView sd_setImageWithURL:url placeholderImage:nil options:SDWebImageProgressiveDownload];

    [self.view addSubview:_imageView];

    CALayer *grayLayer = [[CALayer alloc]init];
    grayLayer.frame = self.view.bounds;
    grayLayer.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3].CGColor;
    [self.view.layer addSublayer:grayLayer];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    SDWebImageManager *imageManger = SDWebImageManager.sharedManager;
    imageManger.delegate = self;
    
    
}

@end
