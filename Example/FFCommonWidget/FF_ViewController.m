//
//  FF_ViewController.m
//  FFCommonWidget
//
//  Created by 399820721@qq.com on 10/28/2017.
//  Copyright (c) 2017 399820721@qq.com. All rights reserved.
//

#import "FF_ViewController.h"

//#import "ffsel"
#import <FFCommonWidget/FFSelectPhotoConst.h>

@interface FF_ViewController ()
/**<#注释#>*/
@property(nonatomic,strong)FFPhotoSelectedView *VC;
@end

@implementation FF_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.VC = [[FFPhotoSelectedView alloc]initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 200)];
    self.VC.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.VC];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openPhotoLib) name:FFNotificOpenPhotoAlbum object:nil];
}

- (void)openPhotoLib
{
    NSLog(@"bbbbb");
}

@end
