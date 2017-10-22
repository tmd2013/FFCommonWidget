//
//  FFPhotoSelectedView.h
//  selectPIC
//
//  Created by nonoking on 2017/10/18.
//  Copyright © 2017年 aiyesoft. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PhotoSelectDelIndex)(NSUInteger idx);

@interface FFPhotoSelectedView : UIView

/**图片数据源*/
@property(nonatomic,strong)NSMutableArray *images;

/**最大照片数量*/
@property(nonatomic,assign)NSUInteger maxCount;

/**当前可选图片数量*/
@property(nonatomic,assign,readonly)NSUInteger currImgCount;

/**删除的下标*/
@property(nonatomic,strong)void(^PhotoSelectDelIndexBlock)(NSUInteger delIdx);

- (void)updateImage:(NSArray *)images;



@end
