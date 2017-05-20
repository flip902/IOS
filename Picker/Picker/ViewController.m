//
//  ViewController.m
//  Picker
//
//  Created by Flip Carlino on 2017-03-22.
//  Copyright © 2017 Flip Carlino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;

- (IBAction)showAnimalChooser:(id)sender;


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


- (IBAction)showAnimalChooser:(id)sender {
    if (self.animalChoserVisable != YES) {
        [self performSegueWithIdentifier:@"toAnimalChooser" sender:sender];
        self.animalChoserVisable=YES;
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ((AnimalChooserViewController *)segue.destinationViewController).delegate=self;
}

- (void)displayAnimal:(NSString *)chosenAnimal
            withSound:(NSString *)chosenSound
        fromComponent:(NSString *)chosenComponent {
    NSString *animalSoundString;
    animalSoundString = [NSString
                         stringWithFormat:@"You changed %@ (%@ and the sound %@)",
                         chosenComponent, chosenAnimal, chosenSound];
    self.outputLabel.text = animalSoundString;
}













@end
