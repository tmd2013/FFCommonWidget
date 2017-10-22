//
//  FFSelectPhotoCell.h
//  selectPIC
//
//  Created by nonoking on 2017/10/18.
//  Copyright © 2017年 aiyesoft. All rights reserved.
//

#import <UIKit/UIKit.h>



@class FFSelectPhotoModel;
@class FFSelectPhotoCell;

@protocol FFSelectPhotoDelegate <NSObject>

- (void)selectPhotoCloseCurrImg:(FFSelectPhotoCell *)cell;

@end

@interface FFSelectPhotoCell : UICollectionViewCell

/**选好的图片*/
@property(nonatomic,strong)FFSelectPhotoModel *selPhotoModel;

/**当前的indexpath*/
@property(nonatomic,strong,readonly)NSIndexPath *indexPath;

/**代理*/
@property(nonatomic,weak)id<FFSelectPhotoDelegate> delegate;

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end
