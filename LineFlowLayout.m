//
//  LineFlowLayout.m
//  FunCollection
//
//  Created by Sarah Allen on 2/3/13.
//  Copyright (c) 2013 Sarah Allen. All rights reserved.
//

#import "LineFlowLayout.h"

@implementation LineFlowLayout

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

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    
    return YES;
}


@end
