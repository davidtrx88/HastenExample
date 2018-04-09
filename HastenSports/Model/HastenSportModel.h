//
//  HastenSportModel.h
//  HastenSports
//
//  Created by David Cruz Toral on 8/4/18.
//  Copyright © 2018 David. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HastenSportModel : NSObject

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *players; //HastenPlayerModel

@end
