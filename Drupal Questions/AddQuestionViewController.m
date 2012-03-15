//
//  AddQuestionViewController.m
//  Drupal Questions
//
//  Created by Kyle Browning on 3/15/12.
//  Copyright (c) 2012 Grasscove. All rights reserved.
//

#import "AddQuestionViewController.h"

@interface AddQuestionViewController ()

@end

@implementation AddQuestionViewController

- (id)initWithStyle:(UITableViewStyle)style
{
  self = [super initWithStyle:style];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  UIButton *a1 = [UIButton buttonWithType:UIButtonTypeCustom];
  [a1 setFrame:CGRectMake(0.0f, 0.0f, 69.0f, 32.0f)];
  [a1 addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
  [a1 setImage:[UIImage imageNamed:@"back_button_off.png"] forState:UIControlStateNormal];
  [a1 setImage:[UIImage imageNamed:@"back_button_on.png"] forState:UIControlStateHighlighted];
  UIBarButtonItem *random1 = [[UIBarButtonItem alloc] initWithCustomView:a1];
  UIButton *a2 = [UIButton buttonWithType:UIButtonTypeCustom];
  [a2 setFrame:CGRectMake(0.0f, 0.0f, 76.0f, 32.0f)];
  [a2 addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
  [a2 setImage:[UIImage imageNamed:@"done_button_off.png"] forState:UIControlStateNormal];
  [a2 setImage:[UIImage imageNamed:@"done_button_on.png"] forState:UIControlStateHighlighted];
  UIBarButtonItem *random2 = [[UIBarButtonItem alloc] initWithCustomView:a2];
  
  self.navigationItem.rightBarButtonItem = random2;
  self.navigationItem.leftBarButtonItem = random1;
}
- (void)back:(id)sender {
  [self.navigationController popViewControllerAnimated:YES];
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


@end
