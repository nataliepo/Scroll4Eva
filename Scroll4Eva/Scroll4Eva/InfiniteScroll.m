//
//  InfiniteScroll.m
//  Scroll4Eva
//
//  Created by Natalie Podrazik on 7/25/12.
//  Copyright (c) 2012 29th Street Publishing. All rights reserved.
//

#import "InfiniteScroll.h"
#import <QuartzCore/QuartzCore.h>



@implementation InfiniteScroll


-(id)init:(float)frameHeight count:(int)count {
    
    self = [super init];
    
    if (self) {
        maxHeight = frameHeight;
        active_count = count;
    }
    
    return self;
}

/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

 */
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"viewDidScroll - Scroll view position = (%.2f, %.2f)\n", scrollView.contentOffset.x, scrollView.contentOffset.y);
    
    
    float active_height = scrollView.contentOffset.y;
    
    /* These are always zero 
    UIEdgeInsets ei = scrollView.contentInset;
    
    NSLog(@"\t ei = {%.2f, %.2f, %.2f, %.2f}\n", 
          ei.top, ei.right, ei.bottom, ei.left);
     */
    
    NSLog(@"active height = %.2f\n", active_height);
    

    
    if (active_height >= maxHeight) {
        //NSLog(@"\n\t At the bottom.\n");
    }
    
    if (active_height > (maxHeight * 0.5)) {
        NSLog(@"\n\t DRAWING MORE (count = %d)\n", active_count);
        
        [self drawRows:scrollView];
    }
    
}



-(void)drawRows:(UIScrollView*)scrollView {

    
    int num_more = 10;

    CGRect scrollyFrame = scrollView.frame;
    int buffer_x = 0; // the space on the right and left side
    int buffer_y = 0;  // space at the top and bottom of the inner scrolly frame
    
    int row_width = scrollyFrame.size.width;
    
    int row_height = 100;

    
    // height is:
    //  top and bottom y-buffers
    //  each row's height
    //  spacer between rows (count - 1)
    int total_scroll_height = ((active_count + num_more) * row_height);
    
    // make the article scrollview tall enough for these subivews.
    scrollView.contentSize = CGSizeMake(scrollyFrame.size.width, total_scroll_height);
    
    
    // Start drawing elements where the last one left off.
    int starting_y = buffer_y + (active_count * row_height);
    
    //NSLog(@"\n Starting y = %d\n", starting_y);
    
    for (int i = active_count; i < (active_count + num_more); i++) {
        
        CGRect thisFrame = CGRectMake(buffer_x, 
                                      starting_y, 
                                      row_width ,
                                      row_height);
        
        
        //NSLog(@"\t active_count=%d, height = %d\n", active_count, starting_y);
        
        UIButton * articleButton = [[UIButton alloc] initWithFrame:thisFrame];        
        
        //[self styleArticleInFlapListing:articleButton article_id:article_id];
        [InfiniteScroll styleArticleButton:articleButton value:[NSString stringWithFormat:@"%d", i]];
        
        
        //[articleButton addTarget:self action:@selector(goToArticle:) forControlEvents:UIControlEventTouchUpInside];                    
        
        [scrollView addSubview:articleButton];
        
        articleButton = nil;
        // draw the next frame lower.
        starting_y += (buffer_y + row_height);
    }
    
    [scrollView setNeedsDisplay];
    
    
    // update the max height.
    if (active_count == 0) {
        maxHeight = scrollView.frame.size.height;
        
    }
    else {
        maxHeight = (active_count * row_height);
    }
    
    NSLog(@"\t active_count = %d, maxHeight = %.2f\n", active_count, maxHeight);
    
    // now update the thing that triggers the more-draw action    
    active_count += num_more;


}

+(void)styleArticleButton:(UIButton*)articleButton value:(NSString*)value {
    [articleButton setBackgroundColor:[UIColor whiteColor]];
    
    
    CGSize buttonSize = articleButton.frame.size;
    
    UITextView * buttonTitle = [[UITextView alloc] initWithFrame:CGRectMake(0, (buttonSize.height / 3), 
                                                                            buttonSize.width, buttonSize.height)];
    
    buttonTitle.textColor = [UIColor grayColor];
    buttonTitle.font = [UIFont fontWithName:@"Futura-Medium" size:18.0];
    buttonTitle.backgroundColor = [UIColor clearColor];
    buttonTitle.text = value;
    buttonTitle.textAlignment = UITextAlignmentCenter;
    
    
    
    
    [articleButton addSubview:buttonTitle];
    
    articleButton.userInteractionEnabled = YES;
    
    articleButton.layer.cornerRadius = 5.0;
    
    
    
    buttonTitle = nil;
    
    
}

@end
