//
//  LLShowHUD.m
//  ProjectB
//
//  Created by long on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "LLShowHUD.h"

@implementation LLShowHUD

+(void)showHUD:(UIView *)view Message:(NSString *)str AfterDelay:(double)delay{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        
        // Set the text mode to show only text.
        hud.mode = MBProgressHUDModeText;
        hud.label.text = str;
        // Move to bottm center.
        hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
        
        [hud hideAnimated:YES afterDelay:delay];
    });
}


+(void)showCustomViewHUD:(UIView *)view ImageName:(NSString *)imageName Message:(NSString *)str AfterDelay:(double)delay{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        
        // Set the custom view mode to show any view.
        hud.mode = MBProgressHUDModeCustomView;
        // Set an image view with a checkmark.
        UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        hud.customView = [[UIImageView alloc] initWithImage:image];
        // Looks a bit nicer if we make it square.
        hud.square = YES;
        // Optional label text.
        hud.label.text = str;
        
        [hud hideAnimated:YES afterDelay:delay];
    });
}

+(void)showDataRequestHUD:(UIView *)view Message:(NSString *)str NetWorkRequest:(NetWorkRequestBlock)requestBlock{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // Set some text to show the initial status.
    hud.label.text = str;
    // Will look best, if we set a minimum size.
    hud.minSize = CGSizeMake(150.f, 100.f);
    requestBlock();
    
    
}


@end
