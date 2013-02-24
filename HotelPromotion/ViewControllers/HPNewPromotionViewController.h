//
//  HPNewPromotionViewController.h
//  HotelPromotion
//
//  Created by Le Viet Tien on 24/2/13.
//  Copyright (c) 2013 nus.cs3217. All rights reserved.
//

#import "BaseViewController.h"

@interface HPNewPromotionViewController : BaseViewController
@property (strong, nonatomic) UITextField *titleTextField;
@property (strong, nonatomic) UITextView *contentTextView;
@property (strong, nonatomic) UITextField *categoryTextField;
@property (strong, nonatomic) UITextField *capacityTextField;
@property (strong, nonatomic) UITextField *startTimeTextField;
@property (strong, nonatomic) UITextField *endTimeTextField;
@property (strong, nonatomic) NSDate *startTime;
@property (strong, nonatomic) NSDate *endTime;
@end
