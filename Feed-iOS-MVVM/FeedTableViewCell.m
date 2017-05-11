//
//  FeedTableViewCell.m
//  Feed-iOS-MVVM
//
//  Created by Cpt. Omsub Sukkhee on 4/28/17.
//  Copyright © 2017 omsub. All rights reserved.
//

#import "FeedTableViewCell.h"

@interface FeedTableViewCell()

@property (weak, nonatomic) IBOutlet UIButton *headerButton;
@property (weak, nonatomic) IBOutlet UILabel *headerUsernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerTimeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageContent;

@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

@end

@implementation FeedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setImageContentAsImagePath:(NSString *)imagePath {
    UIImage *image = [UIImage imageNamed:imagePath];
    [self.imageContent setImage:image];
}

@end
