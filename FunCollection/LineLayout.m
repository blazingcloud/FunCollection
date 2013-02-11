//
//  LineLayout.m
//  FunCollection
//
//  Created by Sarah Allen on 2/3/13.
//  Copyright (c) 2013 Blazing Cloud, Inc.. All rights reserved.
//

#import "LineLayout.h"

@interface LineLayout ()
@property(nonatomic,strong) NSMutableArray *itemAttributes;

@end

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
        
    NSInteger itemCount = [[self collectionView] numberOfItemsInSection:0];
    
    _itemAttributes = [NSMutableArray arrayWithCapacity:itemCount];
    int currentx = self.minMargin;
    
    for (int i = 0; i < itemCount; i++) {
        NSIndexPath* path = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
        attr.frame = CGRectMake(currentx, 0, self.itemSize.width, self.itemSize.height);
        [_itemAttributes addObject:attr];
        currentx += self.itemSize.width + self.interItemSpacing;
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
    
    return CGSizeMake((self.itemSize.width+self.interItemSpacing) * itemCount + self.minMargin*2, self.itemSize.height);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return [self.itemAttributes filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(UICollectionViewLayoutAttributes *evaluatedObject, NSDictionary *bindings) {
        return CGRectIntersectsRect(rect, [evaluatedObject frame]);
    }]];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path
{
    return (self.itemAttributes)[path.item];
}



@end
