//
//  HPBookingsTableViewController.m
//  HotelPromotion
//
//  Created by Le Viet Tien on 24/2/13.
//  Copyright (c) 2013 nus.cs3217. All rights reserved.
//

#import "HPBookingsTableViewController.h"
#import "HPBookingTableViewCell.h"
#import "HPBookingDetailViewController.h"

@interface HPBookingsTableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *bookings;
@end

@implementation HPBookingsTableViewController

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
    [self.tabBarItem setTitle:@"My Bookings"];
    [self.navigationItem setTitle:@"My Bookings"];
    [self.navigationController.tabBarItem setTitle:@"My Bookings"];
    
    [self setupTableView];
    [[HPCredentialsManager sharedInstance] updateBookings];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshTableView) name:@"updateBookingsSucceed" object:nil];
}


- (void)setupTableView {
    CGRect tableViewFrame = CGRectMake(0, 0, self.view.size.width, self.view.size.height);
    UITableView *tv = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    self.tableView = tv;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (void)refreshTableView {
    self.bookings = [[HPCredentialsManager sharedInstance] bookings];
    [self.tableView reloadData];
}

#pragma mark - UITableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.bookings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *contactTableViewCellIdentifier = @"BookingViewCell";
    HPBookingTableViewCell *cell = (HPBookingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:contactTableViewCellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HPBookingTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    HPBooking *bookings = [self.bookings objectAtIndex:indexPath.row];
    // cell.textLabel.text= (NSString*)bookings.startDate;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/YYYY"];
    cell.textLabel.text = [formatter stringFromDate:bookings.bookTime];
    cell.detailTextLabel.text = bookings.confirmationNum;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    HPPromotion *promotion = [self.promotions objectAtIndex:indexPath.row];
    //    HPPromotionDetailViewController *detailVC = [[HPPromotionDetailViewController alloc] initWithPromotion:promotion];
    //    [self.navigationController pushViewController:detailVC animated:YES];
    
    [self performSegueWithIdentifier:@"BookingDetailSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"BookingDetailSegue"]) {
        /*
         HPPromotionDetailViewController *detailVC = (HPPromotionDetailViewController *)segue.destinationViewController;
         NSIndexPath *indexPath = (NSIndexPath *)sender;
         HPPromotion *promotion = [self.promotions objectAtIndex:indexPath.row];
         detailVC.promotion = promotion;
         */
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        HPBooking *bookings= [self.bookings objectAtIndex:indexPath.row];
        HPBookingDetailViewController *detailVC = (HPBookingDetailViewController *)segue.destinationViewController;
        detailVC.booking = bookings;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
