//
//  HastenPlayerTableViewCell.h
//  HastenSports
//
//  Created by David Cruz Toral on 8/4/18.
//  Copyright © 2018 David. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HastenPlayerModel;

@interface HastenPlayerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *playerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *surnameLabel;

- (void)setModel:(HastenPlayerModel *)model;

@end
