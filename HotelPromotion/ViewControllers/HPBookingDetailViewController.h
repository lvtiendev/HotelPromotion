//
//  HPBookingDetailViewController.h
//  HotelPromotion
//
//  Created by Shaohuan Li on 25/2/13.
//  Copyright (c) 2013 nus.cs3217. All rights reserved.
//

#import "BaseViewController.h"

@interface HPBookingDetailViewController : BaseViewController
@property (nonatomic, strong) HPBooking *booking;
- (id)initWithBooking:(HPBooking *)booking;
@end
