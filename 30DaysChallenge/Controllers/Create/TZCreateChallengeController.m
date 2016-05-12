//
//  TZCreateChallengeController.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/11.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "TZCreateChallengeController.h"
#import "TZTextField.h"
#import "TZPickerView.h"

#import "TZTestView.h"

@interface TZCreateChallengeController ()

@property (weak, nonatomic) IBOutlet TZTextField *challengeNameTextField;
@property (weak, nonatomic) IBOutlet TZTextField *startTimeTextField;
@property (weak, nonatomic) IBOutlet TZTextField *remindTimeTextField;
@property (weak, nonatomic) IBOutlet UIButton *headerImageButton;

@end

@implementation TZCreateChallengeController

- (void)viewDidLoad {
    [super viewDidLoad];
    _headerImageButton.layer.cornerRadius = kNormalCornerRadius;
    _headerImageButton.layer.masksToBounds = YES;
    
    WeakSelf(self);
    [self setNaviLeftItemWithTitle:@"取消" callback:^{
        [weakSelf.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [self setNaviRightItemWithTitle:@"确定" callback:^{
        
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)startTimeEdit:(TZTextField *)sender {
    TZPickerView *pickerView = [TZPickerView getDatePickerViewInView:self.view datePickerModel:UIDatePickerModeDate date:[NSDate date] callback:^(BOOL isSelected, NSString *dateString) {
        [sender endEditing:YES];
        sender.placeholder = [NSString stringWithFormat:@"%@ %@",@"开始时间", dateString];
    }];
    sender.inputView = pickerView;
}

- (IBAction)remindTimeEdit:(TZTextField *)sender {
    TZPickerView *pickerView = [TZPickerView getDatePickerViewInView:self.view datePickerModel:UIDatePickerModeTime date:[NSDate date] callback:^(BOOL isSelected, NSString *dateString) {
        [sender endEditing:YES];
        sender.placeholder = [NSString stringWithFormat:@"%@ %@",@"提醒时间", dateString];
    }];
    sender.inputView = pickerView;
}

- (IBAction)headerImageButtonClicked:(UIButton *)sender {
}


@end
