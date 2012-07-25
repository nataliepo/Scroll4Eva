//
//  InfiniteScroll.h
//  Scroll4Eva
//
//  Created by Natalie Podrazik on 7/25/12.
//  Copyright (c) 2012 29th Street Publishing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfiniteScroll : NSObject <UIScrollViewDelegate> {
    float maxHeight;
    float activeScrollFrameHeight;
    
    int active_count;
}


-(id)init:(float)frameHeight count:(int)count;


+(void)styleArticleButton:(UIButton*)articleButton value:(NSString*)value;
-(void)drawRows:(UIScrollView*)scrollView;

@end
