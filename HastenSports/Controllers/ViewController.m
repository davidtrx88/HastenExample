//
//  ViewController.m
//  HastenSports
//
//  Created by David Cruz Toral on 8/4/18.
//  Copyright © 2018 David. All rights reserved.
//

#import "ViewController.h"
#import "HastenPlayerModel.h"
#import "HastenSportModel.h"
#import "HastenPlayerTableViewCell.h"

@interface ViewController ()

@property (nonatomic,strong)  NSData *data;
@property (nonatomic, strong) NSDictionary *dictionary;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self callWebService];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma -mark UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.model.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [(HastenSportModel *)self.model[section] title];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [(HastenSportModel *)[self.model objectAtIndex:section] players].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    cell = (HastenPlayerTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"playerCell" forIndexPath:indexPath];
    
    [(HastenPlayerTableViewCell *)cell setModel: [[(HastenSportModel *)[self.model objectAtIndex:indexPath.section] players] objectAtIndex:indexPath.row] ];
    
    
    return cell;
}

#pragma -mark UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150.0f;
}

- (void)callWebService{
    
    NSError *error = nil;
    NSString *url_string = [NSString stringWithFormat: @"https://api.myjson.com/bins/66851"];
    self.data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    
    if (self.data && self.data.length>0 ) {
        self.model = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableContainers error:&error];
        
       self.model = [self convertModelToArrayOfModels:self.model];
        
        
    }else{
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"UPS" message:@"Some error occur, Try again" preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}

#pragma mark - Converter

- (NSMutableArray *)convertModelToArrayOfModels:(NSMutableArray *)array{
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithCapacity:0];
    NSMutableArray *mutableArrayAux = [[NSMutableArray alloc] initWithCapacity:0];

    for (HastenSportModel* sportModel in array) {

        HastenSportModel *hastenSportModel = [[HastenSportModel alloc] init];
        hastenSportModel.type =  [sportModel valueForKey:@"type"];
        hastenSportModel.title = [sportModel valueForKey:@"title"];
        hastenSportModel.players = [sportModel valueForKey:@"players"];
        
        
        for (HastenPlayerModel* playerModel in hastenSportModel.players) {
            HastenPlayerModel *hastenPlayerModel = [[HastenPlayerModel alloc] init];
            hastenPlayerModel.name =  [playerModel valueForKey:@"name"];
            hastenPlayerModel.surname = [playerModel valueForKey:@"surname"];
            hastenPlayerModel.image = [playerModel valueForKey:@"image"];
            
            [mutableArrayAux addObject:hastenPlayerModel];
            
        }
        hastenSportModel.players = mutableArrayAux;
        
        [mutableArray addObject:hastenSportModel];
        mutableArrayAux = [[NSMutableArray alloc] initWithCapacity:0];
    }

    return mutableArray;
}

@end
