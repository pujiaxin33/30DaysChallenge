//
//  TZPickerView.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/11.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "TZPickerView.h"

@interface TZPickerView ()
//<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) UIToolbar *toolbar;
@property (strong, nonatomic) UIPickerView *pickerView;
@property (strong, nonatomic) UIDatePicker *datePickerView;
@property (nonatomic, copy) DatePickerCallback datePickerCallback;

@end

@implementation TZPickerView

- (void)dealloc
{
    _datePickerCallback = nil;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUIWithFrame:frame];
    }
    return self;
}

- (void)initUIWithFrame:(CGRect)frame
{
    _datePickerView = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 44, frame.size.width, 216)];
//    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, frame.size.width, 216)];
//    _pickerView.dataSource = self;
//    _pickerView.delegate = self;
    _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 44)];
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancleButtonClicked:)];
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *confirmItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(confirmButtonClicked:)];
    
    [_toolbar setItems:@[cancelItem, flexibleItem, confirmItem]];
    
    [self addSubview:_toolbar];
    [self addSubview:_datePickerView];
}

+ (TZPickerView *)showDatePickerViewInView:(UIView *)parentView
                           datePickerModel:(UIDatePickerMode)datePickerMode
                                      date:(NSDate *)date
                                  callback:(DatePickerCallback)callback
{
    TZPickerView *pickerView = [self getDatePickerViewInView:parentView datePickerModel:datePickerMode date:date callback:callback];
    pickerView.bottom = 0;
    [parentView addSubview:pickerView];
    return pickerView;
}

+ (TZPickerView *)getDatePickerViewInView:(UIView *)parentView
                          datePickerModel:(UIDatePickerMode)datePickerMode
                                     date:(NSDate *)date
                                 callback:(DatePickerCallback)callback
{
    TZPickerView *pickerView = [[TZPickerView alloc] initWithFrame:CGRectMake(0, 0, parentView.width, 260)];
    
    pickerView.datePickerCallback = callback;
    pickerView.pickerView.hidden = YES;
    pickerView.datePickerView.datePickerMode = datePickerMode;
    pickerView.datePickerView.date = date;
    pickerView.datePickerView.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    
    return pickerView;
}

#pragma mark
#pragma mark UIPickerViewDataSource

//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
//{
//    
//}
//
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
//{
//    
//}
//
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    
//}


- (void)cancleButtonClicked:(id)sender {
    if (self.datePickerCallback) {
        self.datePickerCallback(NO, nil);
    }
}

- (void)confirmButtonClicked:(id)sender {
    NSString *dateFormatStr;
    switch (self.datePickerView.datePickerMode) {
        case UIDatePickerModeTime:
        {
            dateFormatStr = @"HH:mm";
        }
            break;
        case UIDatePickerModeDate:
        {
            dateFormatStr = @"yyyy年MM月dd";
        }
            break;
        default:
            break;
    }
    
    NSDate *selectedDate = self.datePickerView.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormatStr];
    NSString *dateStr = [formatter stringFromDate:selectedDate];
    if (self.datePickerCallback) {
        self.datePickerCallback(YES, dateStr);
    }
}

@end
