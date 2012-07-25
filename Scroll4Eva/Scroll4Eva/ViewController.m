//
//  ViewController.m
//  Scroll4Eva
//
//  Created by Natalie Podrazik on 7/25/12.
//  Copyright (c) 2012 29th Street Publishing. All rights reserved.
//

#import "ViewController.h"
#import "InfiniteScroll.h"



@interface ViewController ()

@end

@implementation ViewController
@synthesize scrollView;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // first, draw in random numbers and rows.
    
    
        
    
    //[self drawInitialArticleSet:num_rows row_height:row_height];

    
    
    infiniteScrollVC = [[InfiniteScroll alloc] init:scrollView.frame.size.height count:0];

    scrollView.delegate = infiniteScrollVC;
    
    [infiniteScrollVC drawRows:scrollView];
    
    
    

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
    infiniteScrollVC = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

-(void)drawInitialArticleSet:(int)count {

    NSMutableArray * articles = [[NSMutableArray alloc] initWithCapacity:count];

    for (int i = 0; i < count; i++) {
        [articles addObject:[NSNumber numberWithInt:i]];    
    }
    
    
    // now, let the row drawing method continue.
    
}


@end
