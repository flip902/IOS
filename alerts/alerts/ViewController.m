//
//  ViewController.m
//  alerts
//
//  Created by Flip Carlino on 2017-03-20.
//  Copyright © 2017 Flip Carlino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *userOutput;

- (IBAction)doAlert:(id)sender;
- (IBAction)doMultiButtonAlert:(id)sender;
- (IBAction)doAlertInput:(id)sender;
- (IBAction)doSound:(id)sender;
- (IBAction)doAlertSound:(id)sender;
- (IBAction)doVibration:(id)sender;

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


// Yes, No Alert
- (IBAction)doAlert:(id)sender {
    UIAlertController* alert = [UIAlertController
                                alertControllerWithTitle:@"Cloud Café"
                                                 message:@"Do you agree to our terms and conditions?"
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction* action1 = [UIAlertAction actionWithTitle:@"Yes"
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * action) {
                                                        _userOutput.text = @"Yes";
                                                        }];
    
    UIAlertAction* action2 = [UIAlertAction actionWithTitle:@"No"
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * action) {
                                                        _userOutput.text = @"No";
                                                        }];
    [alert addAction:action1];
    [alert addAction:action2];
    [self presentViewController:alert animated:YES completion:nil];
}



// Multi Button Action Sheet
- (IBAction)doMultiButtonAlert:(id)sender {
    
    UIAlertController* multiAlert = [UIAlertController
                                     alertControllerWithTitle:@"Cloud Café"
                                                      message:@"I need your attention now!"
                                               preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"Maybe Later"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                              _userOutput.text = @"I'll check back again later";
                                                          }];
    UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"Never"
                                                           style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                               _userOutput.text = @"I'll Just fuck off then";
                                                           }];
    
    UIAlertAction *thirdAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                               _userOutput.text = @"Attention!";
                                                           }];
    
    [multiAlert addAction:firstAction];
    [multiAlert addAction:secondAction];
    [multiAlert addAction:thirdAction];
    
    
    [self presentViewController: multiAlert animated:YES completion:nil];
    
}




// Input Alert
- (IBAction)doAlertInput:(id)sender {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Email Address"
                                          message:@"Please enter your email address"
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"example@mail.com";
    }];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    UIAlertAction *emailAction = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style: UIAlertActionStyleDefault
                                 handler:^(UIAlertAction *action) {
        
        UITextField * textField = alertController.textFields.firstObject;
        NSString *email = textField.text;
        _userOutput.text = email;
        }];
    
    [alertController addAction:emailAction];

}







// Play system Sound
- (IBAction)doSound:(id)sender {
    SystemSoundID soundID;
    NSString *soundFile = [[NSBundle mainBundle]
                           pathForResource:@"soundeffect" ofType:@"wav"];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundID);
    
    AudioServicesPlaySystemSound(soundID);
}


// Alert Sound (Vibrates on silent)
- (IBAction)doAlertSound:(id)sender {
    SystemSoundID soundID;
    NSString *soundFile = [[NSBundle mainBundle]
                           pathForResource:@"alertsound" ofType:@"wav"];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundID);
    
    AudioServicesPlayAlertSound(soundID);
}


// Vibrate
- (IBAction)doVibration:(id)sender {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}


@end
