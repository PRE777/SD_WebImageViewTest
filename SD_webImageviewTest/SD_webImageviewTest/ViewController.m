//
//  ViewController.m
//  SD_webImageviewTest
//
//  Created by LW on 2018/8/13.
//  Copyright © 2018年 iWhere. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *controllersArr ;
@property (nonatomic,strong) NSArray<NSString*> *titleArr;

@property (nonatomic,strong) UITableView *myTableView;

@end

@implementation ViewController
//http://qiniu.iwhere.com/zntn/e8d33cad5215de45b3ea08cda0ad2f8e.jpg

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _controllersArr = [NSArray arrayWithObjects:@"LoadImageViewController",@"DownLoadImageViewController", nil];
    _titleArr = [NSArray arrayWithObjects:@"加载图片",@"图片下载", nil];
    _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
   
}


#pragma mark - TableViewDelegate , TableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.controllersArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CELLID = @"CELL_ID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLID];
    }
    cell.textLabel.text = self.titleArr[indexPath.row];
    
    return  cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *classStr = self.controllersArr[indexPath.row];
    Class class = NSClassFromString(classStr);
    UIViewController *vc = [[class alloc]init];
    vc.title = self.titleArr[indexPath.row];
    [self.navigationController pushViewController:vc animated:true];
    
}


@end
