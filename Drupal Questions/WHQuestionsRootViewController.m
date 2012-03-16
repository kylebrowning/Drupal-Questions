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
//  NSMutableDictionary *nodeData = [NSMutableDictionary new];
//  [nodeData setValue:@"testtitle" forKey:@"title"];
//  NSDictionary *bodyValues = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"bodsdfasdfasdy", nil] forKeys:[NSArray arrayWithObjects:@"value", nil]];
//  NSDictionary *languageDict = [NSDictionary dictionaryWithObject:[NSArray arrayWithObject:bodyValues] forKey:@"und"];
//  [nodeData setValue:languageDict forKey:@"body"];
//  [nodeData setValue:@"article" forKey:@"type"];
//  [nodeData setValue:@"und" forKey:@"language"];
//  //  [nodeData setValue:@"admin" forKey:@"name"];
//  //  
//  //  [nodeData setValue:@"7" forKey:@"uid"];
//  //  [node nodeGet:nodeData];
//  //  [node nodeUpdate:nodeData];
//  //  [node nodeDelete:nodeData];
//  [node nodeSave:nodeData];
  NSMutableDictionary *fileData = [NSMutableDictionary new];
  NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"bg.png"], 0.5);
  [fileData setValue:@"temp" forKey:@"name"];
  [fileData setValue:@"temp.jpg" forKey:@"fileName"];
  [fileData setValue:imageData forKey:@"fileData"];
  [fileData setValue:@"image/png" forKey:@"mimetype"];
  [fileData setValue:@"field_image" forKey:@"field_name"];
  [fileData setValue:@"4" forKey:@"nid"];
  [node nodeAttachFile:fileData];
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
  
  [user userLogin:userData];
  [user userLoginWithUsername:@"username" andPassword:@"password"];
  //[user userLogout];
}
- (void)testTaxonmy:(id)sender {
  DIOSTaxonomy *taxonomy = [[DIOSTaxonomy alloc] init];
  //[taxonomy getTreeWithVid:@"1" withParent:nil andMaxDepth:nil];
  //  [taxonomy selectNodesWithTid:@"1" andLimit:@"2" andPager:nil andOrder:nil];
  [taxonomy getTermWithTid:@"2"];
}
- (void)testFile:(id)sender {
  DIOSFile *file = [[DIOSFile alloc] initWithDelegate:self];
  NSMutableDictionary *fileData = [NSMutableDictionary new];
  [fileData setValue:@"4" forKey:@"fid"];
    [fileData setValue:@"0" forKey:@"file_contents"];
  [file fileGet:fileData];
  
}
- (IBAction)addQuestion:(id)sender {
  [self performSegueWithIdentifier:@"addQuestion" sender:sender];
}
- (IBAction)test:(id)sender {
  DIOSNode *node = [[DIOSNode alloc] initWithDelegate:self];
  NSMutableDictionary *nodeData = [NSMutableDictionary new];
  [nodeData setValue:@"9" forKey:@"nid"];
  [node nodeGet:nodeData];
}
- (void)fileGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  [[[DIOSSession sharedSession] delegate] callDidFinish:status operation:operation response:response error:error];

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
  return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"questioncell";
  WHQuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  // Configure the cell...
  [[cell questionTitle] setText:@"Services question"];
  [[cell sessionName] setText:@"Native Mobile Application Development"];
  [[cell commentCount] setText:@"2"];
  [[cell authorName] setText:@"Kyle Browning"];
  return cell;
}

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
