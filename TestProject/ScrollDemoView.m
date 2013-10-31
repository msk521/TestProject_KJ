

#import "ScrollDemoView.h"

@implementation ScrollDemoView
@synthesize scrollView;
@synthesize dictionar;
@synthesize imageCount,currentPage,checkDouble;
@synthesize dxelegate;

- (id)initWithFrame:(CGRect)frame imgeCount:(int)imgeCount
{
    self = [super initWithFrame:frame];
    if (self) {
        numberOfPages = imgeCount;
        scrollView = [[UIScrollView alloc] initWithFrame:frame];
        scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        scrollView.contentSize = CGSizeMake(numberOfPages*scrollView.frame.size.width, scrollView.frame.size.height);
        
        scrollView.delegate = self;

        scrollView.pagingEnabled = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.scrollsToTop = NO;
        
        prevPageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        currentPageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        nextPageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        
        [self addSubview:scrollView];
    }
    return self;
}

-(void)printDictionar{
    NSLog(@"allkeys === %@", dictionar);

    [self setWithPageNumber:currentPage];
}

-(void)setWithPageNumber:(NSInteger)pageNumber{
    
    CGFloat pageWidth = self.scrollView.frame.size.width;
    CGFloat pageHeight = self.scrollView.frame.size.height;
    currentPageView.frame = CGRectMake(pageWidth*currentPage, 0, pageWidth, pageHeight);

    [currentPageView setImage:[UIImage imageWithContentsOfFile:[dictionar objectForKey:[NSString stringWithFormat:@"%d",currentPage]]]];
	NSLog(@"--------:%@",[dictionar objectForKey:[NSString stringWithFormat:@"%d",currentPage]]);
    if (pageNumber == 0) {
        prevPageView.frame = CGRectZero;
        currentPageView.frame = CGRectMake(0, 0, pageWidth, pageHeight);
        nextPageView.frame = CGRectMake(pageWidth, 0, pageWidth, pageHeight);
        [nextPageView setImage:[UIImage imageWithContentsOfFile:[dictionar objectForKey:[NSString stringWithFormat:@"%d",currentPage+1]]]];
        
    }else if(currentPage == (numberOfPages - 1)){
        nextPageView.frame = CGRectZero;
        prevPageView.frame = CGRectMake(((currentPage - 1) * pageWidth), 0, pageWidth, pageHeight);
        [prevPageView setImage:[UIImage imageWithContentsOfFile:[dictionar objectForKey:[NSString stringWithFormat:@"%d",currentPage-1]]]];
    }else{
        prevPageView.frame = CGRectMake(((currentPage - 1) * pageWidth), 0, pageWidth, pageHeight);
        nextPageView.frame = CGRectMake(((currentPage + 1) * pageWidth), 0, pageWidth, pageHeight);
        [prevPageView setImage:[UIImage imageWithContentsOfFile:[dictionar objectForKey:[NSString stringWithFormat:@"%d",currentPage-1]]]];
        [nextPageView setImage:[UIImage imageWithContentsOfFile:[dictionar objectForKey:[NSString stringWithFormat:@"%d",currentPage+1]]]];
    
    }

    [self.scrollView addSubview:currentPageView];
    [self.scrollView addSubview:prevPageView];
    [self.scrollView addSubview:nextPageView];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //手动滑动
    DZAppDelegate *delegate = (DZAppDelegate *)[[UIApplication sharedApplication] delegate];
    delegate.isScrollView = YES;
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
NSLog(@"scrollViewDidEndScrollingAnimation");
    //点击button滑动
 DZAppDelegate *delegate = (DZAppDelegate *)[[UIApplication sharedApplication] delegate];
    delegate.isScrollView = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    NSInteger page = floor((self.scrollView.contentOffset.x - pageWidth/2) / pageWidth) + 1;
 
    if ((currentPage == page) || page < 0 || page > numberOfPages) {
       // NSLog(@"====================:%d  %d",page,currentPage);
        return;
    }else{
        NSLog(@"============|||||||||||:%d",currentPage);
        NSInteger prevPage = currentPage;
       
        currentPage = page;

        self.scrollView.userInteractionEnabled = NO;
        
        [self performSelector:@selector(refreshPageViewAfterPaged:) withObject:[NSNumber numberWithInteger:prevPage] afterDelay:0.1];
        checkDouble = NO;
    }
}

- (void)refreshPageViewAfterPaged:(NSNumber *)prevPageNumber{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    CGFloat pageHeight = self.scrollView.frame.size.height;

    NSInteger prevPage = [prevPageNumber integerValue];

    UIImageView *tempPageView = nil;
    
    if (!checkDouble) {
        if (currentPage - 1 == prevPage) {
            tempPageView = currentPageView;
            currentPageView = nextPageView;
            nextPageView = prevPageView;
            prevPageView = tempPageView;
            
            prevPageView.frame = CGRectMake(((currentPage - 1) * pageWidth), 0, pageWidth, pageHeight);
            currentPageView.frame = CGRectMake(currentPage * pageWidth, 0, pageWidth, pageHeight);
            
            if (currentPage == (numberOfPages - 1)) {
                nextPageView.frame = CGRectZero;
                [self  setWithPageNumber: currentPage];
            }else{
                nextPageView.frame = CGRectMake(((currentPage + 1) * pageWidth), 0, pageWidth, pageHeight);
                [self setWithPageNumber:currentPage];
            }
            
        }else if(currentPage + 1 == prevPage){
            tempPageView = currentPageView;
            currentPageView = prevPageView;
            prevPageView = nextPageView;
            nextPageView = tempPageView;
            
            currentPageView.frame = CGRectMake(currentPage * pageWidth, 0, pageWidth, pageHeight);
            nextPageView.frame = CGRectMake(((currentPage + 1) * pageWidth), 0, pageWidth, pageHeight);
            
            if (currentPage == 0) {
                prevPageView.frame = CGRectZero;
            }else{
                prevPageView.frame = CGRectMake(((currentPage - 1) * pageWidth), 0, pageWidth, pageHeight);
                
                [self setWithPageNumber:currentPage];
            }
        }
        NSLog(@"-----------%d",currentPage);
     
        [dxelegate scrollViewDidEndToScroll:currentPage];
        
        checkDouble = YES;
    }
    
    self.scrollView.userInteractionEnabled = YES;
    
}

-(void)scrollView_Scro:(int) tag{
//	CGFloat pageWidth = self.scrollView.frame.size.width;
	NSInteger page = tag;
	
	if ((currentPage == page) || page < 0 || page > numberOfPages) {
		// NSLog(@"====================:%d  %d",page,currentPage);
		return;
	}else{
		NSLog(@"============|||||||||||:%d",currentPage);
		NSInteger prevPage = currentPage;
		
		currentPage = page;
		
		self.scrollView.userInteractionEnabled = NO;
		
		[self performSelector:@selector(refreshPageViewAfterPaged:) withObject:[NSNumber numberWithInteger:prevPage] afterDelay:0.1];
		checkDouble = NO;
	}
}


@end
