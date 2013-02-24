//
//  HPPromotionDetailViewController.m
//  HotelPromotion
//
//  Created by Le Viet Tien on 24/2/13.
//  Copyright (c) 2013 nus.cs3217. All rights reserved.
//

#import "HPPromotionDetailViewController.h"

@interface HPPromotionDetailViewController ()
@end

@implementation HPPromotionDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = self.promotion.title;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.imageView setImageWithURL:[NSURL URLWithString:self.promotion.thumbnail] placeholderImage:[UIImage imageNamed:@"promotion_picture_thumbnail"]];
    self.contentText.text = self.promotion.content;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/YYYY"];
    self.startTimeLabel.text = [formatter stringFromDate:self.promotion.startTime];
    self.endTimeLabel.text = [formatter stringFromDate:self.promotion.endTime];
    
    // STAFF
    if ([[[HPCredentialsManager sharedInstance] currentUser].uType intValue] == 1) {
        [self.bookingButton setEnabled:NO];
    }
}

- (id)initWithPromotion:(HPPromotion *)promotion {
    if (self = [super init]) {
        self.promotion = promotion;
    }
    return self;
}

- (IBAction)bookPromotion:(id)sender {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setImageView:nil];
    [self setStartTimeLabel:nil];
    [self setEndTimeLabel:nil];
    [self setBookingButton:nil];
    [super viewDidUnload];
}
@end
