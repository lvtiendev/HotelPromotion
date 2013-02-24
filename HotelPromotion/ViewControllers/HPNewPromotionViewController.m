//
//  HPNewPromotionViewController.m
//  HotelPromotion
//
//  Created by Le Viet Tien on 24/2/13.
//  Copyright (c) 2013 nus.cs3217. All rights reserved.
//

#import "HPNewPromotionViewController.h"
#import "HPCustomDatePickerViewController.h"
#import "HPLoginViewController.h"

@interface HPNewPromotionViewController () <UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation HPNewPromotionViewController

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
    [self.navigationItem setTitle:@"New Promotion"];
    [self.navigationController.tabBarItem setTitle:@"New Promotion"];
    
    self.scrollView.contentSize = CGSizeMake(320, 400);
    
    self.titleTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 280, 30)];
    [self.scrollView addSubview:self.titleTextField];
    self.titleTextField.placeholder = @"Promotion title";
    self.titleTextField.borderStyle = UITextBorderStyleBezel;
    self.titleTextField.delegate = self;
    
    self.contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, 70, 280, 100)];
    [self.scrollView addSubview:self.contentTextView];
    [self.contentTextView setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:0.2]];
    self.contentTextView.delegate = self;
    
    self.categoryTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 190, 130, 30)];
    [self.scrollView addSubview:self.categoryTextField];
    self.categoryTextField.placeholder = @"Category";
    self.categoryTextField.borderStyle = UITextBorderStyleBezel;
    self.categoryTextField.delegate = self;
    
    self.capacityTextField = [[UITextField alloc] initWithFrame:CGRectMake(170, 190, 130, 30)];
    [self.scrollView addSubview:self.capacityTextField];
    self.capacityTextField.placeholder = @"Capacity";
    self.capacityTextField.borderStyle = UITextBorderStyleBezel;
    self.capacityTextField.delegate = self;
    
    self.startTimeTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 240, 130, 30)];
    [self.scrollView addSubview:self.startTimeTextField];
    self.startTimeTextField.placeholder = @"Start Time";
    self.startTimeTextField.borderStyle = UITextBorderStyleBezel;
    self.startTimeTextField.delegate = self;
    
    self.endTimeTextField = [[UITextField alloc] initWithFrame:CGRectMake(170, 240, 130, 30)];
    [self.scrollView addSubview:self.endTimeTextField];
    self.endTimeTextField.placeholder = @"End Time";
    self.endTimeTextField.borderStyle = UITextBorderStyleBezel;
    self.endTimeTextField.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == self.startTimeTextField) {
        [self performSegueWithIdentifier:@"DatePickerSegue" sender:textField];
        return NO;
    } else if (textField == self.endTimeTextField) {
        [self performSegueWithIdentifier:@"DatePickerSegue" sender:textField];
        return NO;
    } else {
        return YES;
    }
}

- (IBAction)makePromotion:(id)sender {
    HPPromotion *promotion = [[HPPromotion alloc] init];
    promotion.title = self.titleTextField.text;
    promotion.content = self.contentTextView.text;
    promotion.category = self.categoryTextField.text;
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    promotion.maxBook = [f numberFromString:self.capacityTextField.text];
    promotion.startTime = self.startTime;
    promotion.endTime = self.endTime;
    promotion.hid = [[HPCredentialsManager sharedInstance] currentUser].hid;
    [[HPCredentialsManager sharedInstance] insertNewPromotion:[promotion toDictionaryUseNullValue:YES]];
}

- (void)setStartTime:(NSDate *)startTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/YYYY"];
    _startTime = startTime;
    self.startTimeTextField.text = [formatter stringFromDate:startTime];
}

- (void)setEndTime:(NSDate *)endTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/YYYY"];
    _endTime = endTime;
    self.endTimeTextField.text = [formatter stringFromDate:endTime];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DatePickerSegue"]) {
        HPCustomDatePickerViewController *datePickerVC = (HPCustomDatePickerViewController *)segue.destinationViewController;
        datePickerVC.previousVC = self;
        if (sender == self.startTimeTextField) {
            datePickerVC.customTitle = @"Start Time";
        } else {
            datePickerVC.customTitle = @"End Time";
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTitleTextField:nil];
    [self setContentTextView:nil];
    [self setCategoryTextField:nil];
    [self setCapacityTextField:nil];
    [self setStartTimeTextField:nil];
    [self setEndTimeTextField:nil];
    [self setScrollView:nil];
    [super viewDidUnload];
}
@end
