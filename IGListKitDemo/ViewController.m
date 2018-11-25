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
#import "ForthViewController.h"
#import "FifthViewController.h"
#import "SixthViewController.h"
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
            break;
        case 3:
            [self.navigationController pushViewController:[ForthViewController new] animated:YES];
            break;
        case 4:
            [self.navigationController pushViewController:[FifthViewController new] animated:YES];
            break;
        case 5:
            [self.navigationController pushViewController:[SixthViewController new] animated:YES];
        default:
            break;
    }
}


@end
