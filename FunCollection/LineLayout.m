//
//  LineLayout.m
//  FunCollection
//
//  Created by Sarah Allen on 2/3/13.
//  Copyright (c) 2013 Sarah Allen. All rights reserved.
//

#import "LineLayout.h"

@implementation LineLayout
#define ACTIVE_DISTANCE 200
#define ZOOM_FACTOR 0.3


- (id)init
{
    self = [super init];
    if (self)
    {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.itemSize = (CGSize){60, 50};
                
        self.minimumLineSpacing = 5.0;
        self.minimumInteritemSpacing = 5.0;
        
    }
    return self;
}

- (void)prepareLayout
{
    // call super so flow layout can do all the math for cells, headers, and footers
    [super prepareLayout];
    // do stuff
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
//    UICollectionView* view = self.collectionView;
//    CGFloat height = view.bounds.size.height;
//    CGFloat top = height - self.itemSize.height;
//    CGPoint offset = view.contentOffset;
//    self.sectionInset = UIEdgeInsetsMake(offset.x, top, 0, 0);

    return YES;
}

@end
