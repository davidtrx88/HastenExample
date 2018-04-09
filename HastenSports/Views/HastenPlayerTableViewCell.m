//
//  HastenPlayerTableViewCell.m
//  HastenSports
//
//  Created by David Cruz Toral on 8/4/18.
//  Copyright © 2018 David. All rights reserved.
//

#import "HastenPlayerTableViewCell.h"
#import "HastenPlayerModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation HastenPlayerTableViewCell

- (void)setModel:(HastenPlayerModel *)model{
    self.nameLabel.text = model.name;
    self.surnameLabel.text = model.surname;
    
    //Se utiliza una librería de terceros para mejorar la carga de las imagenes en la tabla. https://github.com/rs/SDWebImage
    [self.playerImageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
