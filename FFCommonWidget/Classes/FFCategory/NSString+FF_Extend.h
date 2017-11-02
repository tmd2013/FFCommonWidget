//
//  NSString+FF_Extend.h
//  FFCommonWidget_Example
//
//  Created by nonoking on 2017/11/2.
//  Copyright © 2017年 399820721@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FF_Extend)

/**
 *  得道沙盒路径(Document)
 *
 */
+ (NSString *)ffString_getDocumentPath;

+ (NSString *)ffString_getDocumentPathWithFileName:(NSString *)fileName;

/**
 *  得道沙盒路径(Library/Caches)
 *
 */
+ (NSString *)ffString_getLibCachePath;

+ (NSString *)ffString_getLibCachePathWithFileName:(NSString *)fileName;

/**
 *  获取设备型号然后手动转化为对应名称
 *
 */
+ (NSString *)ffString_getDeviceName;

/**
 *  判断字符串是否是手机号
 *
 */
+ (BOOL)ffString_isMobileNumber:(NSString *)mobileNum;
@end
