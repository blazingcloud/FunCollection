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
#import "LineFlowLayout.h"
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
    UICollectionView* view = self.collectionView;
    CGFloat height = view.bounds.size.height;

    switch (layoutStyle)
    {
        case LayoutStyleGrid:
        {
            GridLayout *newGridLayout = [[GridLayout alloc] init];
            newLayout = newGridLayout;

        }
        break;
           
        case LayoutStyleLineFlow:
        {
            LineFlowLayout *newLineFlowLayout = [[LineFlowLayout alloc] init];
            
            CGFloat top = height - newLineFlowLayout.itemSize.height -90;
            newLineFlowLayout.sectionInset = UIEdgeInsetsMake(top, 0, 0, 0);
            newLayout = newLineFlowLayout;

        }
        break;

        case LayoutStyleLine:
        {
            LineLayout *newLineLayout = [[LineLayout alloc] init];
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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewFlowLayout *layout = collectionViewLayout;
    CGFloat width = layout.itemSize.width;
    return CGSizeMake(width, width + (indexPath.item % 5)*20);
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
