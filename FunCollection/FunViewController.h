//
//  FunViewController.h
//  FunCollection
//
//  Created by Sarah Allen on 2/2/13.
//  Copyright (c) 2013 Blazing Cloud, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

enum {
    LayoutStyleLineFlow,
    LayoutStyleGrid,
    LayoutStyleLine,
    LayoutStyleCount
}
typedef LayoutStyle;

@interface FunViewController : UIViewController
- (IBAction)switchLayout:(id)sender;

@property (nonatomic, assign, readonly) LayoutStyle layoutStyle;

@end
