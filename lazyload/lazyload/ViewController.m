//
//  ViewController.m
//  lazyload
//
//  Created by wjc on 2024/8/18.
//

#import "ViewController.h"
#import "Model.h"
#import "Header.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray<Model *> * models;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSections];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[Header class] forHeaderFooterViewReuseIdentifier:@"header"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)setupSections {
    self.models = [NSMutableArray array];
    [self.models addObject:[[Model alloc] initWithName:@"Mac" items:@[@"MacBook", @"MacBook Air", @"MacBook Pro", @"iMac", @"Mac Pro", @"Mac mini", @"Accessories", @"OS X El Capitan"] collapsed:YES]];
    [self.models addObject:[[Model alloc] initWithName:@"iPad" items:@[@"iPad Pro", @"iPad Air 2", @"iPad mini 4", @"Accessories"] collapsed:NO]];
    [self.models addObject:[[Model alloc] initWithName:@"iPhone" items:@[@"iPhone 6s", @"iPhone 6", @"iPhone SE", @"Accessories"] collapsed:NO]];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.models.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    Model *sectionData = self.models[section];
    return sectionData.collapsed ? 0 : sectionData.items.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    Header *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    
    if (!header) {
        header = [[Header alloc] initWithReuseIdentifier:@"header"];
    }
    
    Model *sectionData = self.models[section];
    header.titleLabel.text = sectionData.name;
    header.rowButton.tag = section;
    [header.rowButton addTarget:self action:@selector(toggleCollapse:) forControlEvents:UIControlEventTouchUpInside];
    
    [self rotateButton:header.rowButton collapsed:sectionData.collapsed];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Model *sectionData = self.models[indexPath.section];
    cell.textLabel.text = sectionData.items[indexPath.row];
    
    return cell;
}



- (void)toggleCollapse:(UIButton *)sender {
    NSInteger section = sender.tag;
    Model *sectionData = self.models[section];
    sectionData.collapsed = !sectionData.collapsed;
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)rotateButton:(UIButton *)button collapsed:(BOOL)collapsed {
    CGFloat angle = collapsed ? 0.0 : M_PI_2;
    button.transform = CGAffineTransformMakeRotation(angle);
}
@end
