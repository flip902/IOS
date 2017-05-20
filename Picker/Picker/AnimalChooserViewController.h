//
//  AnimalChooserViewController.h
//  Picker
//
//  Created by Flip Carlino on 2017-03-22.
//  Copyright © 2017 Flip Carlino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AnimalChooserViewController : UIViewController <UIPickerViewDataSource,
UIPickerViewDelegate>

@property (weak, nonatomic) id delegate;

@end
