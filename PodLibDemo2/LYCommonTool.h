//
//  LYCommonTool.h
//  Aipai
//
//  Created by heyou on 2019/11/7.
//  Copyright © 2019 www.aipai.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYCommonTool : NSObject

//生成文件的MD5   校验的是压缩包的MD5  判断下载是否正确
+ (NSString *)calculateFileMd5WithFilePath:(NSString *)filePath;

/**
 push方式打开目标页面

 @param targetVC 目标页面
 @param viewController push前的页面
 */
+ (void)pushToTargetViewController:(UIViewController *)targetVC inViewController:(UIViewController *)viewController;
@end

NS_ASSUME_NONNULL_END
