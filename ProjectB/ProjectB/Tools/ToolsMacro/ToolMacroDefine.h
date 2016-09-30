//
//  ToolMacroDefine.h
//  AllRivierToOne
//
//  Created by long on 16/9/27.
//  Copyright © 2016年 long. All rights reserved.
//

#ifndef ToolMacroDefine_h
#define ToolMacroDefine_h


//屏幕宽高
#define VIEW_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define VIEW_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//字符串判空
#define IsEmptyString(str) (([str isKindOfClass:[NSNull class]] || str == nil || [str length]<=0)? YES : NO )

//NSLog
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

//颜色RGBA
#define LLRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]

//图片加载背景
#define PlaceholderImage [UIImage imageNamed:@"placeholderImage"]
#endif /* ToolMacroDefine_h */
