//
//  FunViewController.m
//  FunCollection
//
//  Created by Sarah Allen on 2/2/13.
//  Copyright (c) 2013 Sarah Allen. All rights reserved.
//

#import "FunViewController.h"
#import "GridLayout.h"
#import "LineLayout.h"
#import "SimpleColorCell.h"

NSString *kCellID = @"cellID";                          // UICollectionViewCell storyboard id



@interface FunViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, assign) LayoutStyle layoutStyle;

@end

@implementation FunViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.collectionView registerClass:[SimpleColorCell class] forCellWithReuseIdentifier:@"cellID"];

    [self setLayoutStyle:LayoutStyleGrid animated:NO];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setLayoutStyle:(LayoutStyle)layoutStyle animated:(BOOL)animated
{
    if (layoutStyle == self.layoutStyle)
        return;
    
    UICollectionViewLayout *newLayout = nil;
    LineLayout *newLineLayout = nil;
    
    switch (layoutStyle)
    {
        case LayoutStyleGrid:
            newLayout = [[GridLayout alloc] init];
            break;
            
        case LayoutStyleLine:
        {
            newLineLayout = [[LineLayout alloc] init];
            
            UICollectionView* view = self.collectionView;
            CGFloat height = view.bounds.size.height;
            CGFloat top = height - newLineLayout.itemSize.height - 10;
            newLineLayout.sectionInset = UIEdgeInsetsMake(top, 0, 0, 0);
            newLayout = newLineLayout;
        }
        break;
            
        default:
            break;
    }
    
    if (!newLayout)
        return;
    
    [newLayout invalidateLayout];
    self.layoutStyle = layoutStyle;
    
    [self.collectionView setCollectionViewLayout:newLayout animated:animated];

    // scroll to the first visible cell
    // workarond for bug where views disappear when switching layouts
    // http://stackoverflow.com/questions/13780138/dynamically-setting-layout-on-uicollectionview-causes-inexplicable-contentoffset/14075292#14075292
    if ( 0 < self.collectionView.indexPathsForVisibleItems.count ) {
        NSIndexPath *firstVisibleIdx = [[self.collectionView indexPathsForVisibleItems] objectAtIndex:0];
        [self.collectionView scrollToItemAtIndexPath:firstVisibleIdx atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
    }

}

#pragma mark - UICollectionView Datasource
// 1
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return 20;
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SimpleColorCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%d",indexPath.item];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}


#pragma mark – custom actions

- (IBAction)switchLayout:(id)sender {
    NSLog ( @"switchLayout called" );
    LayoutStyle newLayout = self.layoutStyle + 1;
    if (newLayout >= LayoutStyleCount)
        newLayout = 0;
    [self setLayoutStyle:newLayout animated:YES];
}
@end
