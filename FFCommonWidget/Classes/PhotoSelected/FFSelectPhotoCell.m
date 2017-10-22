//
//  FFSelectPhotoCell.m
//  selectPIC
//
//  Created by nonoking on 2017/10/18.
//  Copyright © 2017年 aiyesoft. All rights reserved.
//

#import "FFSelectPhotoCell.h"
#import "FFSelectPhotoConst.h"

@interface FFSelectPhotoCell()
@property (weak, nonatomic) IBOutlet UIButton *imgBtn;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;

@end

@implementation FFSelectPhotoCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    FFSelectPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FFSelectPhotoCell" forIndexPath:indexPath];
    [cell setupIndexPath:indexPath];
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
    [self vcRegistNotific];
   
}

#pragma mark - 设置ui
- (void)setupUI
{
    
}

#pragma mark - 设置数据
- (void)setSelPhotoModel:(FFSelectPhotoModel *)selPhotoModel
{
    _selPhotoModel = selPhotoModel;
    [self.imgBtn setImage:[selPhotoModel.selImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    
    self.closeBtn.hidden = selPhotoModel.hiddenCloseBtn;
}

- (void)setupIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
}

#pragma mark - 注册通知和实现
- (void)vcRegistNotific
{
    
}

#pragma mark - 懒加载

#pragma mark - 点击事件
- (IBAction)closeAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(selectPhotoCloseCurrImg:)]) {
        [self.delegate selectPhotoCloseCurrImg:self];
    }
}
- (IBAction)resetImgAction:(UIButton *)sender {
    
    switch (self.selPhotoModel.operate) {
        case FFPhotoOperateOpenPhotoAlbum:
            [self sendOpenPhotoAlbum];
            break;
            
        default:
            
            break;
    }
    
}

#pragma mark - 业务逻辑
- (void)sendOpenPhotoAlbum
{
    NSMutableDictionary *propertyDict = [NSMutableDictionary dictionary];
    [[NSNotificationCenter defaultCenter] postNotificationName:FFNotificOpenPhotoAlbum object:nil userInfo:propertyDict];
}

#pragma mark - 自定义代理

@end
