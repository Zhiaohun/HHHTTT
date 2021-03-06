//
//  LYScrollView.m
//  Demo
//
//  Created by 志恒李-ly on 16/9/2.
//  Copyright © 2016年 志恒李. All rights reserved.
//

#import "LYScrollView.h"


#define kViewWidth CGRectGetWidth(self.frame)
#define kViewHeight CGRectGetHeight(self.frame)
#define kScrollViewWidth kViewWidth * 0.75
#define kScale 0.8
#define kImageTag 888

@interface LYScrollView ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIScrollView * scrollView;

@property (nonatomic, assign) NSInteger currIndex;

@property (nonatomic, assign) CGFloat beginOffX;

@property (nonatomic,assign) CGRect rect;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) NSMutableArray *imgArr;
@property (nonatomic,strong) NSMutableArray *tagArr;

@property (nonatomic,assign)NSInteger refreshTag;

@property (nonatomic,strong) MainTextcardlist *list;


@end

@implementation LYScrollView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}


-(void)setContentOffset:(CGPoint)contentOffset{
    
    _scrollView.contentOffset = contentOffset;
}
-(CGPoint)contentOffset{
    return _scrollView.contentOffset;
}



- (void)setUp
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScrollViewWidth, kViewHeight)];
    self.scrollView.center = self.center;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.clipsToBounds = NO;
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    [self addSubview:self.scrollView];
}

- (void)setItmeArray:(NSMutableArray *)itmeArray
{

    _itmeArray = [NSMutableArray array];
    _itmeArray = itmeArray;
    
    //NSLog(@"itemarrt++++%@",_itmeArray);
    for (NSInteger i = 0; i < _itmeArray.count; i ++) {
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScrollViewWidth * i, kViewHeight * .2, kScrollViewWidth * .9, kViewHeight * .6)];
        _imageView.tag = kImageTag + i;
        [_scrollView addSubview:_imageView];
     
//        imageView.image = [UIImage imageNamed:self.cards[i]];

//        imageView.layer.masksToBounds = YES;
//        imageView.layer.shadowOffset = CGSizeMake(0, 0);
//        imageView.layer.shadowColor = [UIColor yellowColor].CGColor;
//        imageView.layer.shadowRadius = 4;
//        imageView.layer.shadowOpacity = 0.8;
        
        CALayer * layer = [CALayer layer];
        layer.frame = _imageView.bounds;
        layer.contents = (__bridge id _Nullable)([self imageWithRoundedCornersSize:CGSizeMake(_imageView.bounds.size.width, _imageView.bounds.size.height) andCornerRadius:40 image:nil].CGImage);
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.shadowColor = [UIColor cyanColor].CGColor;
        layer.shadowOffset = CGSizeMake(0, 0);
        layer.shadowOpacity = .8;
        layer.shadowRadius = 10;
        layer.cornerRadius = 40;
//        layer.masksToBounds = YES;
        [_imageView.layer addSublayer:layer];
        
     
        
        
//        [imageView.layer insertSublayer:layer atIndex:0];
        
        //NSLog(@"thread___%@ mainthread__%@",[NSThread currentThread],[NSThread mainThread]);
        
        _view = [[NSBundle mainBundle]loadNibNamed:@"MainView" owner:nil options:nil][0];
        
        __weak typeof (self)weakself = self;
        _view.hideBlock = ^(){
            weakself.imageView.hidden = YES;
        } ;
        
        
        
        _view.frame = CGRectMake(0, 0, _imageView.frame.size.width, _imageView.frame.size.height);
        _view.layer.cornerRadius = 40;
        
        //NSLog(@"base++++%@",_mainBase);
        _list = itmeArray[i];
       // NSLog(@"list++++%@",_list);
        
        if ([_list.from isEqualToString:@""]) {
            _view.tip.text = nil;
        }
        else{
            _view.tip.text = [NSString stringWithFormat:@"- %@ -",_list.from];
        }
        
        _view.type.text = @"#文学";
        _view.collection.text = [NSString stringWithFormat:@"收藏%@ 感悟%@",_list.rec,_list.priv];
        _view.from.text = [NSString stringWithFormat:@"来自 %@的文集[%@]",_list.creator.username,_list.originbook.bookname];
        
        _view.bigImg.layer.shadowOffset = CGSizeMake(2, 2);
        _view.bigImg.layer.shadowOpacity = 0.9;
        _view.bigImg.layer.shadowColor = [UIColor blackColor].CGColor;
        
        
        if ([_list.commentcnt isEqualToString:@"1"] && _list.picpath) {
            _view.bigImg.hidden = YES;
            _view.rollImg.hidden = NO;
            _view.rollImg.layer.cornerRadius = 60;
            _view.rollImg.clipsToBounds = YES;
            [_view.rollImg sd_setImageWithURL:[NSURL URLWithString:_list.picpath]];
            _view.realContentLb.text = _list.content;
            
        }
        else if([_list.commercialtag isEqualToString:@"-1.0"] && _list.picpath){
            
            _view.rollImg.hidden = YES;
            _view.bigImg.hidden = NO;
            [_view.bigImg sd_setImageWithURL:[NSURL URLWithString:_list.picpath]];
            _view.realContentLb.text = _list.content;
            
        }
        else{
            _view.bigImg.hidden = YES;
            _view.rollImg.hidden = NO;
            _view.realContentLb.hidden = YES;
            if (_list.content.length < 100) {
                
                _view.contentStr = _list.content;
            }
            else{
                _view.onlytxt.hidden = NO;
                _view.onlytxt.text = _list.content;
            }
            
        }

        
        //[_view drawRect:_imageView.frame];
        [_imageView addSubview:_view];
        

        if (0 == i) {
            continue;
        }
       // _imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, kScale);
        
        
    }
    self.scrollView.contentSize = CGSizeMake(kScrollViewWidth * _itmeArray.count, kViewHeight);
}








- (void)setIsOpenDelete:(BOOL)isOpenDelete
{
    _isOpenDelete = isOpenDelete;
    if (isOpenDelete) {
        UIPanGestureRecognizer * panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGes:)];
        panGes.delegate = self;
        [_scrollView addGestureRecognizer:panGes];
    }
}
- (void)panGes:(UIPanGestureRecognizer *)panGes
{
    CGPoint velocity = [panGes velocityInView:_scrollView];
    CGPoint translation = [panGes translationInView:_scrollView];
    CGPoint location = [panGes locationInView:_scrollView];
    
    NSLog(@"velocity:%@-----translation:%@-----location:%@",NSStringFromCGPoint(velocity),NSStringFromCGPoint(translation),NSStringFromCGPoint(location));
    
    NSInteger index = _scrollView.contentOffset.x / _scrollView.frame.size.width;
    UIImageView * currImageView = [_scrollView viewWithTag:kImageTag + index];
    
    static CGFloat currImageViewCenterY = 0;
    
    if (currImageView) {
        
        if (panGes.state == UIGestureRecognizerStateBegan) {
            currImageViewCenterY = currImageView.center.y;
        }
        
        currImageView.center = CGPointMake(currImageView.center.x, currImageViewCenterY + translation.y);
        
        if (panGes.state == UIGestureRecognizerStateEnded) {
            if (fabs(translation.y) > 200) {
                [UIView animateWithDuration:.25 animations:^{
                    currImageView.center =  CGPointMake(currImageView.center.x, -currImageViewCenterY);
                } completion:^(BOOL finished) {
                    [currImageView removeFromSuperview];
                    
                    [self removeItemIndex:index];
                }];
            }else
            {
                [UIView animateWithDuration:.25 animations:^{
                    currImageView.center = CGPointMake(currImageView.center.x, currImageViewCenterY);
                }];
            }
        }
    }
}
- (void)removeItemIndex:(NSInteger)index
{
    [self.itmeArray removeObjectAtIndex:index];
    if (_delegate && [_delegate respondsToSelector:@selector(scrolIndex:)]) {
        [_delegate scrolIndex:index >= self.itmeArray.count ? index - 1 : index];
    }
    
    if (self.itmeArray.count >= index) {
        self.scrollView.contentSize = CGSizeMake(kScrollViewWidth * _itmeArray.count, kViewHeight);

        for (NSInteger i = index + 1; i <= self.itmeArray.count; i ++) {
            UIImageView * imageView = (UIImageView *)[_scrollView viewWithTag:kImageTag + i];
            if (imageView) {
                
                [UIView animateWithDuration:.25 animations:^{
                    if (index + 1 == i) {
                        imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                    }
                    imageView.center = CGPointMake(imageView.center.x - kScrollViewWidth, imageView.center.y);
                } completion:^(BOOL finished) {
                    imageView.tag -= 1;
                }];
            }
        }
        
        if (1 == self.itmeArray.count) {
            UIImageView * imageView = (UIImageView *)[_scrollView viewWithTag:kImageTag];
            if (imageView) {
                [UIView animateWithDuration:.25 animations:^{
                    imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                }];
            }
        }
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        UIPanGestureRecognizer * panGes = (UIPanGestureRecognizer *)gestureRecognizer;
        
        CGPoint translation = [panGes translationInView:_scrollView];

        if (translation.y < 0) {
            return YES;
        }
    }
    return NO;
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    if (_delegate && [_delegate respondsToSelector:@selector(scrolIndex:)]) {
        [self.delegate scrolIndex:index];
    }
    
    UIImageView * currImageView = [scrollView viewWithTag:kImageTag + index];
    
    UIImageView * beforeImageView = [scrollView viewWithTag:kImageTag + index - 1];
    
    UIImageView * afterImageView = [scrollView viewWithTag:kImageTag + index + 1];
    
    if (currImageView) {
        currImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
    }
    
    if (beforeImageView) {
        beforeImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, kScale);
    }
    
    if (afterImageView) {
        afterImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, kScale);
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.currIndex = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.beginOffX = scrollView.contentOffset.x;
    
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    if (_refreshTag == 1) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"refresh" object:nil];
        
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x <= -50) {
        _refreshTag = 1;
    }
    else{
        _refreshTag = 0;
    }
    
    UIImageView * currImageView = [scrollView viewWithTag:kImageTag + self.currIndex];
    
    UIImageView * beforeImageView = [scrollView viewWithTag:kImageTag + self.currIndex - 1];
    
    UIImageView * afterImageView = [scrollView viewWithTag:kImageTag + self.currIndex + 1];
    
    CGFloat off_X = scrollView.contentOffset.x - _beginOffX;// >0左滑
    
    CGFloat scale = 1 - fabs(off_X / scrollView.frame.size.width);
    
    CGFloat endScale = 1.0;
    if (scale > 1.0) {
        endScale = 1.0;
    }else if (scale > kScale)
    {
        endScale = scale;
    }else{
        endScale = kScale;
    }
//    NSLog(@"----endScale:%f----scale:%f",endScale,scale);
    if (currImageView) {
        currImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, endScale);
    }
    
    if (beforeImageView) {
        
        if (off_X < 0) {
            
            CGFloat beforeScale = 1 - scale + kScale;
            if (beforeScale > 1) {
                beforeScale = 1;
            }
//            NSLog(@"------beforescale:%f",beforeScale);
            beforeImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, beforeScale);
        }else{
            beforeImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, kScale);
        }
        
    }
    
    if (afterImageView) {
        
        if (off_X > 0) {
            CGFloat afterScale = 1 - scale + kScale;
            if (afterScale > 1) {
                afterScale = 1;
            }
//            NSLog(@"------afterscale:%f",afterScale);
            afterImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, afterScale);
        }
        
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (UIImage *)imageWithRoundedCornersSize:(CGSize)sizeToFit andCornerRadius:(CGFloat)radius image:(UIImage *)image
{
    
    CGRect rect = (CGRect){0.f, 0.f, sizeToFit};
    
    UIGraphicsBeginImageContextWithOptions(sizeToFit, NO, UIScreen.mainScreen.scale);
    
    CGContextAddPath(UIGraphicsGetCurrentContext(),
                     [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    
    CGContextClip(UIGraphicsGetCurrentContext());
    
    [image drawInRect:rect];
    
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return output;
}
@end
