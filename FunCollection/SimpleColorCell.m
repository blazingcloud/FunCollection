//
//  SimpleColorCell.m
//  FunCollection
//
//  Created by Sarah Allen on 2/3/13.
//  Copyright (c) 2013 Sarah Allen. All rights reserved.
//

#import "SimpleColorCell.h"
#import "CustomCellBackground.h"

@implementation SimpleColorCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.textColor = [UIColor blackColor];
        self.label.backgroundColor = [UIColor clearColor];
        self.label.font = [UIFont boldSystemFontOfSize:35.0];
        
        UIColor *color = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
        self.backgroundColor = color;
        
        [self.contentView addSubview:self.label];
        
        // change to our custom selected background view
        CustomCellBackground *backgroundView = [[CustomCellBackground alloc] initWithFrame:CGRectZero];
        self.selectedBackgroundView = backgroundView;

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
