//
//  AnimalChooserViewController.m
//  Picker
//
//  Created by Flip Carlino on 2017-03-22.
//  Copyright © 2017 Flip Carlino. All rights reserved.
//

#import "AnimalChooserViewController.h"

#define kComponentCount 2
#define kAnimalComponent 0
#define kSoundComponent 1


@interface AnimalChooserViewController ()

@property (strong, nonatomic) NSArray *animalNames;
@property (strong, nonatomic) NSArray *animalSounds;
@property (strong, nonatomic) NSArray *animalImages;

- (IBAction)dismissAnimalChooser:(UIButton *)sender;

@end

@implementation AnimalChooserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animalNames = @[@"Mouse", @"Goose", @"Cat", @"Dog", @"Snake", @"Bear", @"Pig"];
    self.animalSounds = @[@"Oink", @"Rawr",@"Ssss", @"Roof", @"Meow", @"Honk", @"Squeek"];
    self.animalImages = @[
        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mouse.png"]],
        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"goose.png"]],
        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cat.png"]],
        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dog.png"]],
        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"snake.png"]],
        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bear.png"]],
        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pig.png"]],
    ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)dismissAnimalChooser:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    ((ViewController *)self.delegate).animalChoserVisable=NO;
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return kComponentCount;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == kAnimalComponent) {
        return [self.animalNames count];
    }else {
        return [self.animalSounds count];
    }
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
         forComponent:(NSInteger)component
          reusingView:(UIView *)view {
    if (component == kAnimalComponent) {
        UIImageView *chosenImageView = self.animalImages[row];
        
        UIImageView *workaroundImageView;
        workaroundImageView=[[UIImageView alloc]
            initWithFrame:chosenImageView.frame];
        workaroundImageView.backgroundColor = [UIColor
            colorWithPatternImage:chosenImageView.image];
        
            return workaroundImageView;
        
    }else {
        UILabel *soundLabel;
        soundLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 32)];
        soundLabel.backgroundColor = [UIColor clearColor];
        soundLabel.text = self.animalSounds[row];
        return soundLabel;
    }
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 55.0;
}


-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == kAnimalComponent) {
        return 75.0;
    }else {
        return 150.0;
    }
}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    ViewController *initialView;
    initialView = (ViewController *)self.delegate;
    
    if (component == kAnimalComponent) {
        long chosenSound = [pickerView
                            selectedRowInComponent:kSoundComponent];
        [initialView displayAnimal:self.animalNames[row]
                         withSound:self.animalSounds[chosenSound]
                     fromComponent:@"the Animal"];
    }else {
        long chosenAnimal = [pickerView
                             selectedRowInComponent:kAnimalComponent];
        [initialView displayAnimal:self.animalNames[chosenAnimal]
                         withSound:self.animalSounds[row]
                     fromComponent:@"the Sound"];
    }
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    ViewController *initialView;
    initialView = (ViewController *)self.delegate;
    [initialView displayAnimal:self.animalNames[0]
                     withSound:self.animalSounds[0]
                 fromComponent:@"notthing yet..."];
}















@end
