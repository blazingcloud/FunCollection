//
//  LineLayout.m
//  FunCollection
//
//  Created by Sarah Allen on 2/3/13.
//  Copyright (c) 2013 Blazing Cloud, Inc.. All rights reserved.
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
        // assume width is constant
        self.itemSize = (CGSize){60, 50};
        self.interItemSpacing = 5.0;
        self.minMargin = 10.0;
        
    }
    return self;
}

- (void)prepareLayout
{
    // call super so flow layout can do all the math for cells, headers, and footers
    [super prepareLayout];

    CGFloat contianerWidth = self.collectionView.bounds.size.width;
    
    NSInteger columnCount = floorf((contianerWidth - self.minMargin *2) / self.itemSize.width);
    
    NSInteger itemCount = [[self collectionView] numberOfItemsInSection:0];
    
    self.itemHeightArray = [NSMutableArray arrayWithCapacity:itemCount];

    for (NSInteger i = 0; i < itemCount; i++) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        CGSize size = [self collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];

        self.itemHeightArray[i] = size.height;
    }
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    if (oldBounds.size.width != self.collectionView.bounds.size.width)
        return YES;
    else
        return NO;
}

- (CGSize)collectionViewContentSize
{
    NSInteger itemCount = [[self collectionView] numberOfItemsInSection:0];
    NSInteger columnCount = 0;
    
    CGSize containerSize = self.collectionView.bounds.size;
    columnCount = floorf((containerSize.width - self.minMargin *2)/self.itemSize.width);
    
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    
}

@end
