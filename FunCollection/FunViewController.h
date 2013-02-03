//
//  FunViewController.h
//  FunCollection
//
//  Created by Sarah Allen on 2/2/13.
//  Copyright (c) 2013 Sarah Allen. All rights reserved.
//

#import <UIKit/UIKit.h>

enum {
    LayoutStyleGrid,
    LayoutStyleLine,
    LayoutStyleCount
}
typedef LayoutStyle;

@interface FunViewController : UIViewController
- (IBAction)switchLayout:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *layoutNameField;

@property (nonatomic, assign, readonly) LayoutStyle layoutStyle;

@end
