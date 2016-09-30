//
//  ScienceTableViewController.m
//  ProjectB
//
//  Created by long on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "ScienceTableViewController.h"
#import "NewsImageTableViewCell.h"
#import "NewsImageMoreTableViewCell.h"
#import "NewsTableViewCell.h"
#import "NewsWebViewController.h"
#import "NewsImageViewController.h"
@interface ScienceTableViewController ()

@end

@implementation ScienceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self cellResigest];
}

-(void)cellResigest{
    UINib *newsCellNib = [UINib nibWithNibName:@"NewsTableViewCell" bundle:nil];
    [self.tableView registerNib:newsCellNib forCellReuseIdentifier:@"newscell"];
    
    UINib *newsImageCellNib = [UINib nibWithNibName:@"NewsImageTableViewCell" bundle:nil];
    [self.tableView registerNib:newsImageCellNib forCellReuseIdentifier:@"newsimagecell"];
    
    UINib *newsImageMoewCellNib = [UINib nibWithNibName:@"NewsImageMoreTableViewCell" bundle:nil];
    [self.tableView registerNib:newsImageMoewCellNib forCellReuseIdentifier:@"newsimagemorecell"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
        if (indexPath.row == 0) {
             NewsTableViewCell *newsCell = [tableView dequeueReusableCellWithIdentifier:@"newscell" forIndexPath:indexPath];
            return newsCell;
        }else if (indexPath.row == 1){
            NewsImageTableViewCell *newsImageCell= [tableView dequeueReusableCellWithIdentifier:@"newsimagecell" forIndexPath:indexPath];
            return newsImageCell;
        }else{
             NewsImageMoreTableViewCell *newsImagemoreCell= [tableView dequeueReusableCellWithIdentifier:@"newsimagemorecell" forIndexPath:indexPath];
            return newsImagemoreCell;
        }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 80;
    }else if(indexPath.row == 1){
        return 150;
    }else{
        return 150;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row > 1) {
        NewsWebViewController *webVC = [[NewsWebViewController alloc] init];
        [self.navigationController pushViewController:webVC animated:YES];
    }else{
        NewsImageViewController *imageVC = [[NewsImageViewController alloc] init];
        [self.navigationController pushViewController:imageVC animated:YES];
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
