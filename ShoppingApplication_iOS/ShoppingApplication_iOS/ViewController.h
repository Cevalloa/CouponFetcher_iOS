//
//  ViewController.h
//  ShoppingApplication_iOS
//
//  Created by Alex Cevallos on 7/5/14.
//  Copyright (c) 2014 AlexCevallos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UITextField *textFieldUserNameEntry;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassWordEntry;

- (IBAction)buttonLoginSubmission:(id)sender;

//Creates the formated attribute string for user name & password field
-(NSAttributedString *)createAttributedStringForTextField:(NSString *)stringPassedIn;

//Dismisses UITextField
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
