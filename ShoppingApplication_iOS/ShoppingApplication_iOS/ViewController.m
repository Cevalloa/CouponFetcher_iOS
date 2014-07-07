//
//  ViewController.m
//  ShoppingApplication_iOS
//
//  Created by Alex Cevallos on 7/5/14.
//  Copyright (c) 2014 AlexCevallos. All rights reserved.
//

#import "ViewController.h"
#import "ProductsViewController.h"


@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Lifecycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.textFieldUserNameEntry.attributedPlaceholder = [self createAttributedStringForTextField:@"Username"];
    self.textFieldPassWordEntry.attributedPlaceholder = [self  createAttributedStringForTextField:@"Password"];
}

#pragma mark - Helper Method

//Creates the formated attribute string for user name & password field
-(NSAttributedString *)createAttributedStringForTextField:(NSString *)stringPassedIn
{
    NSAttributedString *convertedStringIntoAttributed = [[NSAttributedString alloc] initWithString:stringPassedIn attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    return convertedStringIntoAttributed;
}

#pragma mark - Event Methods

//Dismisses UITextField
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark - IB Action Methods

- (IBAction)buttonLoginSubmission:(id)sender {
  
    NSDictionary *parameters = @{@"email": self.textFieldUserNameEntry.text, @"password": self.textFieldPassWordEntry.text};

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [manager POST:@"http://api.bluepromocode.com/v2/users/login" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        UIAlertView *successAlert = [[UIAlertView alloc] initWithTitle:@"Successful Login" message:@"This Is Not The Greatest App In The World No.." delegate:nil cancelButtonTitle:@"This Is Just A Tribute" otherButtonTitles:nil];
        [successAlert show];
        
        [self performSegueWithIdentifier:@"nextScene" sender:self];
      //  NSLog(@"success %@", responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"something has gone wrong.. %@", error);
    }];
    
}
@end
