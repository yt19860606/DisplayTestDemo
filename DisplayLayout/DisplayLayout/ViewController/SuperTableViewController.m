//
//  SuperTableViewController.m
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/9.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "SuperTableViewController.h"
#import "DataSupport.h"
#define CELL_REUSE_ID @"AutolayoutTableViewCell"
@interface SuperTableViewController ()
@property (nonatomic, strong) DataSupport *dataSupport;
@end

@implementation SuperTableViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDataSupport];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    NSLog(@"释放");
}

#pragma mark - UITableViewDelegate

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

#pragma mark - Private Method

- (void)createDataSupport {
    self.dataSupport = [[DataSupport alloc] init];
    __weak typeof (self) weak_self = self;
    [self.dataSupport setUpdataDataSourceBlock:^(NSMutableArray *dataSource) {
        weak_self.dataSource = dataSource;
        [weak_self.tableView reloadData];
    }];
    [self addTestData];
}

- (void)addTestData {
    [self.dataSupport addTestData];
}

- (void)registerAutolayoutTableViewCell {
    UINib *cellNib = [UINib nibWithNibName:@"AutolayoutTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:CELL_REUSE_ID];
}

@end
