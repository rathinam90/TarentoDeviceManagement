//
//  UnderlayNavigationBar.m
//  CabHoundPassenger
//
//  Created by Tabrez on 01/02/14.
//  Copyright (c) 2014 Tarento technologies. All rights reserved.
//

#import "UnderlayNavigationBar.h"

@interface UnderlayNavigationBar ()
{
    UIView* _underlayView;
}

- (UIView*) underlayView;

@end

@implementation UnderlayNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) didAddSubview:(UIView *)subview
{
    [super didAddSubview:subview];
    
    if(subview != _underlayView)
    {
        UIView* underlayView = self.underlayView;
        [underlayView removeFromSuperview];
        [self insertSubview:underlayView atIndex:1];
    }
}

- (UIView*) underlayView
{
    if(_underlayView == nil)
    {
        const CGFloat statusBarHeight = 20;    //  Make this dynamic in your own code...
        const CGSize selfSize = self.frame.size;
        
        _underlayView = [[UIView alloc] initWithFrame:CGRectMake(0, -statusBarHeight, selfSize.width, selfSize.height + statusBarHeight)];
        [_underlayView setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
        [_underlayView setBackgroundColor:[UIColor colorWithRed:0.0f green:0.34f blue:0.62f alpha:1.0f]];
        [_underlayView setAlpha:0.36f];
        [_underlayView setUserInteractionEnabled:NO];
        
        [_underlayView setBackgroundColor:[UIColor greenColor]];
        _underlayView.alpha = 0.0f;
    }
    
    return _underlayView;
}


@end
