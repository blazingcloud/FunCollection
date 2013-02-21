//
//  DrawnView.m
//  FunCollection
//
//  Created by Mason on 2/15/13.
//  Copyright (c) 2013 Sarah Allen. All rights reserved.
//

#import "DrawnView.h"
#import <QuartzCore/QuartzCore.h>

@implementation DrawnView {
    NSArray* views;
    NSMutableArray* paths;
    CGPoint a;
    CGPoint b;
}

- (id) initWithCoder:(NSCoder *)decoder {
    if ([super initWithCoder:decoder]) {
        [self setup];
    }
    return self;
}

- (void) setup {
    paths = [NSMutableArray array];

    views = @[
              [[UIView alloc] initWithFrame:CGRectMake(25, 105, 40, 40)],
              [[UIView alloc] initWithFrame:CGRectMake(25, 155, 40, 40)],
              [[UIView alloc] initWithFrame:CGRectMake(25, 205, 40, 40)]
              ];
    
    [views enumerateObjectsUsingBlock:^(UIView* view, NSUInteger idx, BOOL *stop) {
        view.backgroundColor = UIColor.whiteColor;
        [self addSubview:view];
    }];
    
}

- (void)drawRect:(CGRect)rect {
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGFloat color[4] = { 1.0f, 1.0f, 1.0f, 1.0f};
    CGContextSetStrokeColor(c, color);

    CGContextBeginPath(c);
    CGContextMoveToPoint(c, 10.0f, 50.0f);
    CGContextAddLineToPoint(c, 10.0f, 500.0f);
    CGContextAddLineToPoint(c, 400.0f, 500.0f);
    CGContextStrokePath(c);
    
    CGContextSetStrokeColor(c, (CGFloat[4]){ 0.7f, 0.35f, 0.35f, 1.0f});
    CGContextAddRect(c, CGRectMake(a.x - 3, a.y - 3, 6, 6));
    CGContextStrokePath(c);
    
    CGContextSetStrokeColor(c, (CGFloat[4]){ 0.2f, 0.35f, 0.95f, 1.0f});
    CGContextAddRect(c, CGRectMake(b.x - 3, b.y - 3, 6, 6));
    CGContextStrokePath(c);

    CGContextSetStrokeColor(c, (CGFloat[4]){ 0.0f, 0.8f, 0.3f, 1.0f});
    CGContextSetLineDash(c, 3, (CGFloat[2]){ 5.0f, 5.0f }, 2);
    [paths enumerateObjectsUsingBlock:^(UIBezierPath* path, NSUInteger idx, BOOL *stop) {
        CGContextAddPath(c, path.CGPath);
        CGContextStrokePath(c);        
    }];
    

}

- (void) touch:(NSSet *)touches {
    
    [touches enumerateObjectsUsingBlock:^(UITouch* touch, BOOL *stop) {
        CGPoint point = [touch locationInView:self];
        if (self.ab.on) {
            b = point;
            self.x2.text = [@(point.x) stringValue];
            self.y2.text = [@(point.y) stringValue];
        } else {
            a = point;
            self.x1.text = [@(point.x) stringValue];
            self.y1.text = [@(point.y) stringValue];
        }
    }];
    
    [self draw];    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touch:touches];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touch:touches];
}

- (IBAction) draw {
    
    [paths removeAllObjects];
    
    [views enumerateObjectsUsingBlock:^(UIView* view, NSUInteger idx, BOOL *stop) {
        
        UIBezierPath* path = [[UIBezierPath alloc] init];
        [paths addObject:path];
        CGPoint center = view.layer.position;
        [path moveToPoint:center];
        
        CGPoint end = CGPointMake(70 + center.x + (70 * idx), 470);
        
//        [path addQuadCurveToPoint:end controlPoint:a];
        
        [path addCurveToPoint:end
                controlPoint1:a
                controlPoint2:b];
        
        
        CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        animation.path = path.CGPath;
        animation.fillMode = kCAFillModeForwards;
        animation.removedOnCompletion = NO;
        animation.duration = 5.0f;
        animation.autoreverses = YES;
        animation.repeatCount = 1000;
        [view.layer addAnimation:animation forKey:nil];
    }];
    
    [self setNeedsDisplay];
            

}


@end
