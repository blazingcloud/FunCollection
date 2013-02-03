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
        //self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.itemSize = (CGSize){60, 20};
                
        self.minimumLineSpacing = 50.0;
        self.minimumInteritemSpacing = 50.0;
        
//        CGSize viewSize = self.collectionView.bounds.size;
//        CGFloat top = viewSize.height - self.itemSize.height;
//        self.sectionInset = UIEdgeInsetsMake(0, top, 0, 0);

    }
    return self;
}

@end
