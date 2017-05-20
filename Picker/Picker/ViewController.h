//
//  ViewController.h
//  Picker
//
//  Created by Flip Carlino on 2017-03-22.
//  Copyright © 2017 Flip Carlino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimalChooserViewController.h"

@interface ViewController : UIViewController
@property (nonatomic) Boolean animalChoserVisable;

- (void)displayAnimal:(NSString *)chosenAnimal
            withSound:(NSString *)chosenSound
        fromComponent:(NSString *)chosenComponent;

@end

