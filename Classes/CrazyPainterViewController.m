//
//  CrazyPainterViewController.m
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright home 2009. All rights reserved.
//

#import "CrazyPainterViewController.h"
#import "CrazyPainterAppDelegate.h"



@implementation CrazyPainterViewController

-(IBAction)UndoClick{
	CrazyPainterAppDelegate *mainDelegate = (CrazyPainterAppDelegate *)[[UIApplication sharedApplication] delegate];
	id<AbstractCommand> command = [mainDelegate.commands Pop];
	[command Undo];
	[self.view setNeedsDisplay];
}

-(void)PushIt:(id<AbstractCommand>)creator{
	[creator Do];
	CrazyPainterAppDelegate *mainDelegate = (CrazyPainterAppDelegate *)[[UIApplication sharedApplication] delegate];
	[mainDelegate.commands Push:creator];
	[self.view setNeedsDisplay];
}

-(IBAction)TwoClick{
	CreateShape *createCircle = [[CreateShape alloc]initCircleCreator];
	[self PushIt:createCircle];
	[createCircle release];
}

-(IBAction)ThreeClick{
	CreateShape *createCircle = [[CreateShape alloc]initTriangleCreator];
	[self PushIt:createCircle];
	[createCircle release];
}

-(IBAction)FiveClick{
	CreateShape *createCircle = [[CreateShape alloc]initPentagonCreator];
	[self PushIt:createCircle];
	[createCircle release];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event { 
	UITouch* touch = [touches anyObject];
	CreatePoint *command = [[CreatePoint alloc]initWithPoint:[touch locationInView:self.view]];
	@try{
		[self PushIt:command];
	}
	@finally {
		[command release];
	}
} 

/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
	 
 }*/
 


/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}



- (void)dealloc {
    [super dealloc];
}

@end
