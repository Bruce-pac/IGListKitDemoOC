//
//  ViewController.m
//  IGListKitDemo
//
//  Created by gxy on 2018/5/17.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "ViewController.h"
#import "OneCollectionViewController.h"
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

        default:
            break;
    }
}


@end
