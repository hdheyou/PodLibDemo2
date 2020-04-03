//
//  LYCommonTool.m
//  Aipai
//
//  Created by heyou on 2019/11/7.
//  Copyright © 2019 www.aipai.com. All rights reserved.
//

#import "LYCommonTool.h"
#import <CommonCrypto/CommonDigest.h>

@implementation LYCommonTool

+ (NSString *)calculateFileMd5WithFilePath:(NSString *)filePath {
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    if( handle == nil ) {
        NSLog(@"文件出错");
    }
    
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    BOOL done = NO;
    while(!done)
    {
        NSData* fileData = [handle readDataOfLength: 256];
        CC_MD5_Update(&md5, [fileData bytes], (CC_LONG)[fileData length]);
        if( [fileData length] == 0 ) done = YES;
    }
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    NSString *fileMD5 = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                         digest[0], digest[1],
                         digest[2], digest[3],
                         digest[4], digest[5],
                         digest[6], digest[7],
                         digest[8], digest[9],
                         digest[10], digest[11],
                         digest[12], digest[13],
                         digest[14], digest[15]];
    NSLog(@"生成的文件MD5为:%@",fileMD5);
    
    return fileMD5;
}

+ (void)pushToTargetViewController:(UIViewController *)targetVC inViewController:(UIViewController *)viewController {
    if (!targetVC) return;
    if (targetVC.modalPresentationStyle != UIModalPresentationFullScreen) {
        [viewController presentViewController:targetVC animationStyle:(LYTransitionAnimationStyleDefault) completion:nil];
        return;
    }
    targetVC.hidesBottomBarWhenPushed = YES;
    if ([viewController isKindOfClass:[UITabBarController class]]) {
        viewController = ((UITabBarController *)viewController).selectedViewController;
    }
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        [((UINavigationController *)viewController) pushViewController:targetVC animated:YES];
    } else if (viewController.navigationController) {
        [viewController.navigationController pushViewController:targetVC animated:YES];
    } else {
        [viewController presentViewController:[[LYNavigationController alloc] initWithRootViewController:targetVC] animated:YES completion:nil];
    }
}
@end
