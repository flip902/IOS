//
//  ViewController.m
//  gestures
//
//  Created by Flip Carlino on 2017-04-11.
//  Copyright © 2017 Flip Carlino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) CGRect originalRect;

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)foundRotation:(id)sender;
- (IBAction)foundPinch:(id)sender;
- (IBAction)foundSwipe:(id)sender;
- (IBAction)foundTap:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.originalRect = self.imageView.frame;
    
    UIImageView *tempImageView;
    tempImageView = [[UIImageView alloc]
                     initWithImage:[UIImage imageNamed:@"flower.png"]];
                     tempImageView.frame = self.originalRect;
    [self.view addSubview:tempImageView];
    self.imageView = tempImageView;
}

- (IBAction)foundRotation:(id)sender {
    UIRotationGestureRecognizer *recognizer;
    NSString *feedBack;
    double rotation;
    
    recognizer = (UIRotationGestureRecognizer *)sender;
    rotation = recognizer.rotation;
    feedBack = [[NSString alloc]
                initWithFormat:@"Rotated, Radians: %1.2f, Velocity: %1.2f",
                recognizer.rotation, recognizer.velocity];
    self.outputLabel.text = feedBack;
    self.imageView.transform = CGAffineTransformMakeRotation(rotation);
}

- (IBAction)foundPinch:(id)sender {
    UIPinchGestureRecognizer *recognizer;
    NSString *feedBack;
    double scale;
    
    recognizer = (UIPinchGestureRecognizer *)sender;
    scale = recognizer.scale;
    self.imageView.transform = CGAffineTransformMakeRotation(0.0);
    feedBack = [[NSString alloc]
                initWithFormat:@"Pinched, Scale: %1.2f, Velocity: %1.2f",
                recognizer.scale, recognizer.velocity];
    self.outputLabel.text = feedBack;
    self.imageView.frame = CGRectMake(self.originalRect.origin.x,
                                      self.originalRect.origin.y,
                                      self.originalRect.size.width * scale,
                                      self.originalRect.size.height * scale);
}

- (IBAction)foundSwipe:(id)sender {
    self.outputLabel.text = @"Swiped";
}

- (IBAction)foundTap:(id)sender {
    self.outputLabel.text = @"Tapped";
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        self.outputLabel.text = @"Shaking things up!";
        self.imageView.transform = CGAffineTransformIdentity;
        self.imageView.frame = self.originalRect;
    }
}














@end
