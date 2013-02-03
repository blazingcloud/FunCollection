//
//  GridLayout.m
//  FunCollection
//
//  Created by Sarah Allen on 2/3/13.
//  Copyright (c) 2013 Sarah Allen. All rights reserved.
//

#import "GridLayout.h"

@implementation GridLayout

- (id)init
{
    self = [super init];
    if (self)
    {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.itemSize = (CGSize){120, 100};
        
        self.minimumLineSpacing = 10.0;
        self.minimumInteritemSpacing = 10.0;
        
        self.sectionInset = UIEdgeInsetsMake(0, 0, 60, 0);
    
    }
    return self;
}

@end
