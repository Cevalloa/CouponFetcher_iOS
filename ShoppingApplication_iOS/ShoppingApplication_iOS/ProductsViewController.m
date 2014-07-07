//
//  ProductsViewController.m
//  ShoppingApplication_iOS
//
//  Created by Alex Cevallos on 7/6/14.
//  Copyright (c) 2014 AlexCevallos. All rights reserved.
//

#import "ProductsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface ProductsViewController ()

@property(nonatomic) NSArray *arrayWithImages;
@property(nonatomic) NSArray *arrayWithPercentOff;

@end

@implementation ProductsViewController

#pragma mark - Lifecycle Methods
//Small parse so placed it before view appears
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    // Do any additional setup after loading the view.

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager GET:@"http://api.bluepromocode.com/v2/promotions" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
       self.arrayWithImages = [NSArray array];
       self.arrayWithImages = [[[[responseObject valueForKey:@"promotions"]valueForKey:@"merchant"]valueForKey:@"logo"]valueForKey:@"retailUrl"];
        
        self.arrayWithPercentOff = [NSArray array];
        self.arrayWithPercentOff = [[[responseObject valueForKey:@"promotions"]valueForKey:@"savings"]valueForKey:@"amountOff"];

        //reloads after entry
        [self.collectionView reloadData];

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"could not fetch links %@", error);
    }];
    
    self.title = @"Extreme Couponing, The App";
}

#pragma  mark - Collection  View Methods

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSURL *url = [NSURL URLWithString:[self.arrayWithImages objectAtIndex:indexPath.row]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeHolderImage = [UIImage imageNamed:@"bluePlaceHolder.png"];
    
    //created weak to prevent retain cycles
    __weak UIImageView * imageLoadedIn = (UIImageView *)[cell viewWithTag:100];
    __weak UILabel * labelPercentOff = (UILabel *)[cell viewWithTag:10];
    
    //Checks if percent off is empty
    if([self.arrayWithPercentOff objectAtIndex:indexPath.row] == [NSNull null]){
        labelPercentOff.text = @"";
    }else{
        labelPercentOff.text = [NSString stringWithFormat:@"%@%% off", [self.arrayWithPercentOff objectAtIndex:indexPath.row]];
    }
    
    //fetches photo for cell
    [imageLoadedIn setImageWithURLRequest:request placeholderImage:placeHolderImage success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {

        //sets passed in image to image within collectioncell
        imageLoadedIn.image = image;
    
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
    }];
    
    return cell;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arrayWithImages.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

@end
