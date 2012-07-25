//
//  ViewController.h
//  Scroll4Eva
//
//  Created by Natalie Podrazik on 7/25/12.
//  Copyright (c) 2012 29th Street Publishing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InfiniteScroll;
@interface ViewController : UIViewController {
    InfiniteScroll * infiniteScrollVC;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
