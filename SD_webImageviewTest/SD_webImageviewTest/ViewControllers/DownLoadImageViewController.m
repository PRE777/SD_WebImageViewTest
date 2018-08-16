//
//  DownLoadImageViewController.m
//  SD_webImageviewTest
//
//  Created by LW on 2018/8/13.
//  Copyright © 2018年 iWhere. All rights reserved.
//

#import "DownLoadImageViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
@interface DownLoadImageViewController ()
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,copy) NSString *nameStr;
@property (nonatomic,assign) int  age;
@property (nonatomic,assign) double height;



@end

@implementation DownLoadImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList([DownLoadImageViewController class], &outCount);
    for (int i = 0; i < outCount; i++) {
        NSString *name = @(property_getName(properties[i]));
        NSString *attibutes = @(property_getAttributes(properties[i]));
        NSLog(@"name = :%@ ----- attibutes = :%@",name,attibutes);
    }
    
    

}

-(void)setupUI{
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20, (SCREEN_WIDTH - 20)*9/16.0)];
    _imageView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_imageView];
}


@end
