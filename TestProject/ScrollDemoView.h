

#import <UIKit/UIKit.h>
@protocol ScrollDemoViewDelegate
-(void)scrollViewDidEndToScroll:(int)index;
@end

@interface ScrollDemoView : UIScrollView<UIScrollViewDelegate>{
    UIScrollView *scrollView;
    
    UIImageView *prevPageView;
    UIImageView *currentPageView;
    UIImageView *nextPageView;
    NSInteger currentPage;
    NSInteger numberOfPages;

    BOOL checkDouble;
}

@property (nonatomic ,retain) id<ScrollDemoViewDelegate> dxelegate;
@property (nonatomic ,assign)  BOOL checkDouble;
@property (nonatomic,assign)  NSInteger currentPage;
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)NSMutableDictionary *dictionar;
@property (nonatomic ,assign) int imageCount;
- (id)initWithFrame:(CGRect)frame imgeCount:(int)imgeCount;
-(void)setWithPageNumber:(NSInteger)pageNumber;
-(void)printDictionar;
-(void)refreshPageViewAfterPaged:(NSNumber *)prevPageNumber;
-(void)scrollView_Scro:(int)tag;
@end
