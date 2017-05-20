//
//  ViewController.m
//  myFlowers
//
//  Created by Flip Carlino on 2017-04-08.
//  Copyright © 2017 Flip Carlino. All rights reserved.
//

#import "ViewController.h"

#define kSectionCount 2
#define kRedSection 0
#define kBlueSection 1

@interface ViewController ()

@property(strong, nonatomic) NSArray *redFlowers;
@property(strong, nonatomic) NSArray *blueFlowers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.redFlowers = @[@"Gerbera", @"Peony", @"Rose", @"Poppy"];
    self.blueFlowers = @[@"Hyacinth", @"Hydrangea", @"Sea Holly", @"Phlox", @"Iris"];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return kSectionCount;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case kRedSection:
            return [self.redFlowers count];
        case kBlueSection:
            return [self.blueFlowers count];
            
        default:
            return 0;
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    switch (section) {
        case kRedSection:
            return @"Red";
        case kBlueSection:
            return @"Blue";
        default:
            return @"Unknown";
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"flowerCell"];
    
    switch (indexPath.section) {
        case kRedSection:
            cell.textLabel.text = self.redFlowers[indexPath.row];
            break;
        case kBlueSection:
            cell.textLabel.text = self.blueFlowers[indexPath.row];
            break;
        default:
            cell.textLabel.text = @"Unknown";
    }
    
    UIImage *flowerImage;
    flowerImage = [UIImage imageNamed:cell.textLabel.text];
    cell.imageView.image = flowerImage;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSString *flowerMessage;
   
    
    switch (indexPath.section) {
        case kRedSection:
            flowerMessage = [NSString stringWithFormat:@"You chose the red flower - %@", self.redFlowers [indexPath.row]];
            break;

        case kBlueSection:
            flowerMessage = [NSString stringWithFormat:@"You chose the blue flower - %@", self.blueFlowers [indexPath.row]];
            break;
        default:
            flowerMessage = [NSString stringWithFormat:@"I Have no Idea what the fuck you choose????"];
            break;
    }
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Flower Selected"
                                                                   message:flowerMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}

@end
