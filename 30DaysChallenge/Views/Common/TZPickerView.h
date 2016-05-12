//
//  TZPickerView.h
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/11.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PickerViewCallback)(BOOL isSelected, NSString *mainStr, NSString *subStr);
typedef void(^DatePickerCallback)(BOOL isSelected, NSString *dateString);

@interface TZPickerView : UIView

+ (TZPickerView *)getDatePickerViewInView:(UIView *)parentView
                           datePickerModel:(UIDatePickerMode)datePickerMode
                                      date:(NSDate *)date
                                  callback:(DatePickerCallback)callback;

+ (TZPickerView *)showDatePickerViewInView:(UIView *)parentView
                           datePickerModel:(UIDatePickerMode)datePickerMode
                                      date:(NSDate *)date
                                  callback:(DatePickerCallback)callback;

@end
