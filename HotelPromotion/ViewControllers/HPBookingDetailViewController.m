//
//  HPBookingDetailViewController.m
//  HotelPromotion
//
//  Created by Shaohuan Li on 25/2/13.
//  Copyright (c) 2013 nus.cs3217. All rights reserved.
//

#import "HPBookingDetailViewController.h"

@interface HPBookingDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *bookTimeText;
@property (strong, nonatomic) IBOutlet UILabel *startTimeText;
@property (strong, nonatomic) IBOutlet UILabel *endTimeText;
@property (strong, nonatomic) IBOutlet UILabel *confirmationNumText;
@property (strong, nonatomic) IBOutlet UILabel *priceText;
@property (strong, nonatomic) IBOutlet UILabel *statusText;

@end

@implementation HPBookingDetailViewController

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
    [self.navigationItem setTitle:@"Details"];
	// Do any additional setup after loading the view.
}
- (id)initWithBooking:(HPBooking *)booking {
    if (self = [super init]) {
        self.booking = booking;
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/YYYY"];
    
    self.bookTimeText.text = [formatter stringFromDate:self.booking.bookTime];
    self.startTimeText.text = [formatter stringFromDate:self.booking.startDate];
    self.endTimeText.text = [formatter stringFromDate:self.booking.endDate];
    self.confirmationNumText.text = self.booking.confirmationNum;
  /*  if([self.booking.status isEqualToNumber:[NSNumber numberWithInt: 0]]){
        self.statusText.text = @"Not Confirmed";
    }else{
        self.statusText.text = @"Confirmed";
    }
    self.priceText.text = [[NSString stringWithFormat:@"%@", [self.booking.bookPrice stringValue]] stringByAppendingString:self.booking.bookCurrency];*/
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setBookTimeText:nil];
    [self setStartTimeText:nil];
    [self setEndTimeText:nil];
    [self setConfirmationNumText:nil];
    [self setPriceText:nil];
    [self setStatusText:nil];
    [super viewDidUnload];
}
@end
