//
//  GesturesVC.m
//  Horitzontal
//
//  Created by Pablo Alejandro Perez Martinez on 23/08/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "GesturesVC.h"

typedef NS_ENUM(NSInteger, MyStyle) {
    MyStyleDefault,
    MyStyleCustom
};

@implementation GesturesVC

-(void) viewDidLoad
{
//    self.tableView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    [super viewDidLoad];
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [self.view addGestureRecognizer:pinchRecognizer];
    
    UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotate:)];
    [self.view addGestureRecognizer:rotationRecognizer];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [panRecognizer setMinimumNumberOfTouches:1];
    [panRecognizer setMaximumNumberOfTouches:1];
    [self.view addGestureRecognizer:panRecognizer];
    
    UITapGestureRecognizer *tapProfileImageRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [tapProfileImageRecognizer setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:tapProfileImageRecognizer];
}


- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer {
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer {
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0;
}

- (void)handlePan:(UIPanGestureRecognizer *)gestureRecognizer {
    
    UIView * contentView = [gestureRecognizer view];
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        // Start of the gesture.
        // You could remove any layout constraints that interfere
        // with changing of the position of the content view.
    }
    else if (gestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        // Calculate new center of the view based on the gesture recognizer's
        // translation.
        CGPoint newCenter = contentView.center;
        newCenter.x += [gestureRecognizer translationInView:self.view].x;
        newCenter.y += [gestureRecognizer translationInView:self.view].y;
        
        // Set the new center of the view.
        contentView.center = newCenter;
        
        // Reset the translation of the recognizer.
        [gestureRecognizer setTranslation:CGPointZero inView:self.view];
    }
    else if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        // Dragging has ended.
        // You could add layout constraints back to the content view here.
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
