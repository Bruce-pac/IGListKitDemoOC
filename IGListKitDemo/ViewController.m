//
//  ViewController.m
//  IGListKitDemo
//
//  Created by gxy on 2018/5/17.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "ViewController.h"
#import "OneCollectionViewController.h"
#import "SecondCollectionViewController.h"
#import "ThirdViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            [self.navigationController pushViewController:[OneCollectionViewController new] animated:YES];
        }
            break;
        case 1:{
            [self.navigationController pushViewController:[SecondCollectionViewController new] animated:YES];
        }
            break;
        case 2:
            [self.navigationController pushViewController:[ThirdViewController new] animated:YES];
        default:
            break;
    }
}


@end
