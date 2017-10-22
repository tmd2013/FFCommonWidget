//
//  FFPhotoSelectedView.m
//  selectPIC
//
//  Created by nonoking on 2017/10/18.
//  Copyright © 2017年 aiyesoft. All rights reserved.
//

#import "FFPhotoSelectedView.h"
#import "FFSelectPhotoCell.h"
#import "FFDefine.h"
#import "FFSelectPhotoConst.h"

@interface FFPhotoSelectedView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,FFSelectPhotoDelegate>

/**存放照片的*/
@property(nonatomic,strong)UICollectionView *photoCV;

/**collectionView*/
@property(nonatomic,weak)UICollectionView *collectionView;



@end

@implementation FFPhotoSelectedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [self vcRegistNotific];
        
    }
    return self;
}

#pragma mark - 设置ui
- (void)setupUI
{
    NSLog(@"%@",NSStringFromCGRect(self.frame));
    [self layoutIfNeeded];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 30) / 2, 200);
//    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self addSubview:collectionView];
    self.collectionView = collectionView;

    [collectionView registerNib:[UINib nibWithNibName:@"FFSelectPhotoCell" bundle:nil] forCellWithReuseIdentifier:@"FFSelectPhotoCell"];
    
    if (self.images == nil) {
        self.images = [NSMutableArray array];
        
        [self.images addObject:[self getDefaultPhotoModel]];
    }
    
    if (self.maxCount == 0) {
        self.maxCount = 2;
    }
    _currImgCount = self.maxCount;
    
}

- (FFSelectPhotoModel *)getDefaultPhotoModel
{
    FFSelectPhotoModel *selPhotoModel = [[FFSelectPhotoModel alloc]init];
    selPhotoModel.selImg = SelectPhotoDefaultImage;
    selPhotoModel.hiddenCloseBtn = YES;
    selPhotoModel.operate = FFPhotoOperateOpenPhotoAlbum;
    return selPhotoModel;
}

#pragma mark - 设置数据


#pragma mark - 注册通知和实现
- (void)vcRegistNotific
{
    
}

#pragma mark - 懒加载



#pragma mark - 点击事件

#pragma mark - 业务逻辑
- (void)reloadDatasourse
{
    [self.collectionView reloadData];
}

- (void)updateImage:(NSArray *)images
{
    for (UIImage *img in images) {
        FFSelectPhotoModel *selModel = [[FFSelectPhotoModel alloc]init];
        selModel.selImg = img;
        selModel.hiddenCloseBtn = NO;
        selModel.operate = FFPhotoOperateNone;
        [self.images insertObject:selModel atIndex:0];
    }
    [self getCurrImg];
    if (self.images.count > self.maxCount) {
        [self.images removeLastObject];
    }
    
    [self reloadDatasourse];
}

#pragma mark - collection代理
// 返回分区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

// 每个分区多少个item
- (NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    FFSelectPhotoCell *cell = [FFSelectPhotoCell cellWithCollectionView:collectionView indexPath:indexPath];
    // 取出每个item所需要的数据
    
    // 取出图片名称
  
    // 取出文字
    cell.selPhotoModel = self.images[indexPath.row];
    cell.delegate = self;
    return cell;
}

- (void)selectPhotoCloseCurrImg:(FFSelectPhotoCell *)cell
{
    [self.images removeObjectAtIndex:cell.indexPath.row];
    if (self.PhotoSelectDelIndexBlock) {
        self.PhotoSelectDelIndexBlock(cell.indexPath.row);
    }
    FFSelectPhotoModel *lastPhotoModel = [self.images lastObject];
    if (lastPhotoModel.operate != FFPhotoOperateOpenPhotoAlbum) {
        [self.images addObject:[self getDefaultPhotoModel]];
    }
    [self getCurrImg];
    [self.collectionView reloadData];
}

- (void)getCurrImg
{
    NSUInteger count = 0;
    for (FFSelectPhotoModel *spmodel in self.images) {
        if (spmodel.operate != FFPhotoOperateOpenPhotoAlbum) {
            count++;
        }
    }
    _currImgCount = self.maxCount - count;
    
    NSLog(@"images = %ld, currImgCount = %ld",self.images.count,_currImgCount);
    
}

@end
