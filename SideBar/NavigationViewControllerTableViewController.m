//
//  NavigationViewControllerTableViewController.m
//  SideBar
//
//  Created by Márk Repits on 2014.10.25..
//  Copyright (c) 2014 Márk Repits. All rights reserved.
//

#import "NavigationViewControllerTableViewController.h"
#import "SWRevealViewController.h"

@interface NavigationViewControllerTableViewController ()

@end

@implementation NavigationViewControllerTableViewController{
    NSArray *menu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    menu = @[@"first", @"secound"];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [menu count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellidentifer = [menu objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifer forIndexPath:indexPath];

    // Configure the cell...
    
    return cell;
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ( [segue isKindOfClass:[SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController =  (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
            
        };
    }
}


@end
