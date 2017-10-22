//
//  FFSelectPhotoModel.h
//  selectPIC
//
//  Created by nonoking on 2017/10/18.
//  Copyright © 2017年 aiyesoft. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    FFPhotoOperateNone = 0,         //不操作
    FFPhotoOperateOpenPhotoAlbum,   //打开相册
} FFSelectPhotoOperate;

@interface FFSelectPhotoModel : NSObject

/**选择的图片*/
@property(nonatomic,strong)UIImage *selImg;

/**是否隐藏关闭按钮*/
@property(nonatomic,assign)BOOL hiddenCloseBtn;

/**操作*/
@property(nonatomic,assign)FFSelectPhotoOperate operate;

@end
