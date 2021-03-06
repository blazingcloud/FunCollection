//
//  LineLayout.h
//  FunCollection
//
//  Created by Sarah Allen on 2/3/13.
//  Copyright (c) 2013 Blazing Cloud, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineLayout : UICollectionViewLayout <UICollectionViewDelegateFlowLayout>

@property CGSize itemSize;
@property CGFloat interItemSpacing;
@property CGFloat minMargin;
@property NSMutableArray *itemHeightArray;

@end
