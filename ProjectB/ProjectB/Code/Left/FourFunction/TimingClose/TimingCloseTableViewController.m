//
//  TimingCloseTableViewController.m
//  ProjectB
//
//  Created by 芏小川 on 2016/9/30.
//  Copyright © 2016年 long. All rights reserved.
//

#import "TimingCloseTableViewController.h"
#import "AppDelegate.h"
#import "TimingCloseTableViewCell.h"

@interface TimingCloseTableViewController ()

@property (nonatomic,assign) NSInteger selectIndex;

@property (nonatomic,assign) NSInteger timeSeconds;
@property (nonatomic,strong)  NSTimer *timer;
@end

@implementation TimingCloseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - private Method -
-(void)initUI{
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TimingCloseTableViewCell" bundle:nil] forCellReuseIdentifier:@"timingCell"];
    UIImage *image = [[UIImage imageNamed:@"goback"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(goback)];
}

-(void)goback{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)exitApp{
    NSLog(@"程序即将退出");
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    UIWindow *window = app.window;
    
    [UIView animateWithDuration:1 animations:^{
        window.alpha = 0;
        window.frame = CGRectMake(0, window.bounds.size.width, 0, 0);
    } completion:^(BOOL finished) {
        exit(0);
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TimingCloseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"timingCell" forIndexPath:indexPath];
    NSArray *textArr = @[@"未设置定时关闭",@"10分钟",@"20分钟",@"30分钟",@"60分钟",@"90分钟",@"120分钟",@"节目播放完毕后自动关闭"];
    cell.label1.text = textArr[indexPath.row];
    if (indexPath.row == 0) {
        cell.tickImg.hidden = NO;
    }

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectIndex = indexPath.row;
    
    if (indexPath.row == 0) {
        [_timer invalidate];
    }
    else{
        switch (indexPath.row) {
            case 1:{
                [_timer invalidate];
                _timeSeconds = 5;
                break;
            }
            case 2:{
                [_timer invalidate];
                _timeSeconds = 10;
                break;
            }
            case 3:{
                [_timer invalidate];
                _timeSeconds = 1800;
                break;
            }
            case 4:{
                [_timer invalidate];
                _timeSeconds = 3600;
                break;
            }
            case 5:{
                [_timer invalidate];
                _timeSeconds = 5400;
                break;
            }
            case 6:{
                [_timer invalidate];
                _timeSeconds = 7200;
                break;
            }
            case 7:{
                [_timer invalidate];
                
                break;
            }
            default:
                break;
        }
        _timer = [NSTimer scheduledTimerWithTimeInterval:_timeSeconds target:self selector:@selector(exitApp) userInfo:nil repeats:NO];
    }
    
}

-(void)setSelectIndex:(NSInteger)selectIndex{
    
    if (_selectIndex != selectIndex) {
        TimingCloseTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:selectIndex inSection:0]];
        cell.tickImg.hidden = NO;
        
        TimingCloseTableViewCell *cell1 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_selectIndex inSection:0]];
        cell1.tickImg.hidden = YES;
        
        _selectIndex = selectIndex;
    }
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
