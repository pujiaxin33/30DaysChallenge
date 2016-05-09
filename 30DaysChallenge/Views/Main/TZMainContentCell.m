//
//  TZMainContentCell.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/7.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "TZMainContentCell.h"


@interface TZMainContentCell ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *challengeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *completedLabel;
@property (weak, nonatomic) IBOutlet UILabel *wordsLabel;

@end

@implementation TZMainContentCell

- (void)awakeFromNib {
    // Initialization code
    _containerView.layer.cornerRadius = 5.f;
    _containerView.layer.masksToBounds = YES;
}

- (void)setData:(TZMainContentModel *)data
{
    _data = data;
    
    _headerImageView.image = ImageWithName(data.pictureName);
    _challengeNameLabel.text = data.challengeName;
    _completedLabel.text = [NSString stringWithFormat:@"已完成%ld/30天", data.completedDays];
    if (data.feeling) {
        _wordsLabel.text = data.feeling;
    }else {
        _wordsLabel.text = data.word;
    }
}

@end
