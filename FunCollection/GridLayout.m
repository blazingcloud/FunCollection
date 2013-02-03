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
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.itemSize = (CGSize){80, 60};
        
        self.minimumLineSpacing = 5.0;
        self.minimumInteritemSpacing = 5.0;
        
        self.sectionInset = UIEdgeInsetsMake(0, 0, 100, 0);
    
    }
    return self;
}

@end
