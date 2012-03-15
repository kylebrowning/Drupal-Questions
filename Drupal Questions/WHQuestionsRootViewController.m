//
//  WHQuestionsRootViewController.m
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import "WHQuestionsRootViewController.h"

@interface WHQuestionsRootViewController ()

@end

@implementation WHQuestionsRootViewController


- (void)action:(id)sender {
  
}
- (void)testNode:(id)sender {
  DIOSNode *node = [[DIOSNode alloc] initWithDelegate:self];
  NSMutableDictionary *nodeData = [NSMutableDictionary new];
  [nodeData setValue:@"testtitle" forKey:@"title"];
  NSDictionary *bodyValues = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"bodsdfasdfasdy", nil] forKeys:[NSArray arrayWithObjects:@"value", nil]];
  NSDictionary *languageDict = [NSDictionary dictionaryWithObject:[NSArray arrayWithObject:bodyValues] forKey:@"und"];
  [nodeData setValue:languageDict forKey:@"body"];
  [nodeData setValue:@"article" forKey:@"type"];
  [nodeData setValue:@"und" forKey:@"language"];
  //  [nodeData setValue:@"admin" forKey:@"name"];
  //  
  //  [nodeData setValue:@"7" forKey:@"uid"];
  //  [node nodeGet:nodeData];
  //  [node nodeUpdate:nodeData];
  //  [node nodeDelete:nodeData];
  [node nodeSave:nodeData];
  //[node nodeIndexWithPage:@"0" fields:nil parameters:nil pageSize:@"5"];
}

- (void)testComment:(id)sender {
  DIOSComment *comment = [[DIOSComment alloc] init];
  //  NSMutableDictionary *commentData = [NSMutableDictionary new];
  //  NSDictionary *bodyValues = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"commentbody", nil] forKeys:[NSArray arrayWithObjects:@"value", nil]];
  //  NSDictionary *languageDict = [NSDictionary dictionaryWithObject:[NSArray arrayWithObject:bodyValues] forKey:@"und"];
  //  [commentData setValue:languageDict forKey:@"comment_body"];
  //  [commentData setValue:@"subjecte is changed" forKey:@"subject"];
  //  [commentData setValue:@"und" forKey:@"language"];
  //  //  [commentData setValue:@"2" forKey:@"cid"];
  [comment commentIndexWithPage:@"0" fields:nil parameters:nil pageSize:@"2"];
  
}

- (void)testUser:(id)sender {
  DIOSUser *user = [[DIOSUser alloc] initWithDelegate:self];
  NSMutableDictionary *userData = [NSMutableDictionary new];
  [userData setValue:@"test" forKey:@"name"];
  [userData setValue:@"test2@gmail.com" forKey:@"mail"];
  [userData setValue:@"test" forKey:@"pass"];
  //[userData setValue:@"56" forKey:@"uid"];
  //[user userSave:userData];
//  [user userGet:userData];
//  [user userUpdate:userData];
//  [user userIndexWithPage:@"0" fields:nil parameters:nil pageSize:@"2"];
//  [user userDelete:userData];
  
  //[user userLogin:userData];
  [user userLogout];
}
- (void)testTaxonmy:(id)sender {
  DIOSTaxonomy *taxonomy = [[DIOSTaxonomy alloc] init];
  //[taxonomy getTreeWithVid:@"1" withParent:nil andMaxDepth:nil];
  //  [taxonomy selectNodesWithTid:@"1" andLimit:@"2" andPager:nil andOrder:nil];
  [taxonomy getTermWithTid:@"2"];
}
- (IBAction)test:(id)sender {
  [self testTaxonmy:sender];
}
- (void)getTreeDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)selectNodesDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)getTermDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)userGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)userSaveDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)userUpdateDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)userDeleteDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)userIndexDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)userLoginDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  DLog(@"%@, %d", [[DIOSSession sharedSession] user], status);
}
- (void)userLogoutDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  DLog(@"%@, %d", [[DIOSSession sharedSession] user], status);
}
- (void)commentGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error]; 
}
- (void)commentSaveDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)commentUpdateDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)commentDeleteDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)commentIndexDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];  
}
- (void)nodeIndexDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)nodeGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)nodeSaveDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)nodeUpdateDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError *)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)nodeDeleteDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError *)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];
}
- (void)viewDidLoad
{
  [super viewDidLoad];
  // Uncomment the following line to preserve selection between presentations.
  // self.clearsSelectionOnViewWillAppear = NO;
  
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;

  UIButton *a2 = [UIButton buttonWithType:UIButtonTypeCustom];
  [a2 setFrame:CGRectMake(0.0f, 0.0f, 34.0f, 32.0f)];
  [a2 addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
  [a2 setImage:[UIImage imageNamed:@"add_button_off.png"] forState:UIControlStateNormal];
  [a2 setImage:[UIImage imageNamed:@"add_button_on.png"] forState:UIControlStateHighlighted];
  UIBarButtonItem *random2 = [[UIBarButtonItem alloc] initWithCustomView:a2];
  
  self.navigationItem.rightBarButtonItem = random2;
  [self.tableView setDelegate:self];
  [self.tableView setDataSource:self];
  [self setTitle:@"Questions"];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  // Return the number of sections.
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  // Return the number of rows in the section.
  return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"questioncell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  // Configure the cell...
  return cell;
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  // Navigation logic may go here. Create and push another view controller.
  /*
   <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
   // ...
   // Pass the selected object to the new view controller.
   [self.navigationController pushViewController:detailViewController animated:YES];
   */
}

@end
