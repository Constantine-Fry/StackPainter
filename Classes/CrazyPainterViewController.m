//
//  CrazyPainterViewController.m
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright home 2009. All rights reserved.
//

#import "CrazyPainterViewController.h"
#import "CrazyPainterAppDelegate.h"
#import "SmartAlertView.h"
#import "FileSystem.h"



@implementation CrazyPainterViewController

-(IBAction)UndoClick{
	CrazyPainterAppDelegate *mainDelegate = (CrazyPainterAppDelegate *)[[UIApplication sharedApplication] delegate];
	id<AbstractCommand> command = [mainDelegate.commands Pop];
	[command Undo];
	[(id)command release];
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

-(IBAction)ClearClick{
	CrazyPainterAppDelegate *mainDelegate = (CrazyPainterAppDelegate *)[[UIApplication sharedApplication] delegate];
	[mainDelegate ClearCommands];
	[self.view setNeedsDisplay];
}

-(IBAction)OpenClick{
	FileSystem *fs = [[FileSystem alloc]init];
	NSArray *files = [fs GetAllStacksInDocs];
	[SmartAlertView ShowTable:@"Choose file" WithItems:files  
								WithTarget:self andAction:@selector(OpenFile:)];
	[fs release];
}

-(void)OpenFile:(NSString*)name {
	if(nil == name)
		return;
	[self ClearClick];
	FileSystem *fs = [[FileSystem alloc]init];
	Stack *stack = [fs ReadStackFromFile:[name stringByAppendingPathExtension:@"stack"]];
	CrazyPainterAppDelegate *mainDelegate = (CrazyPainterAppDelegate *)[[UIApplication sharedApplication] delegate];
	mainDelegate.commands = stack;
	[fs release];
}

-(IBAction)SaveClick{
	[SmartAlertView ShowTextField:@"Input Filename" WithText:nil WithTarget:self andAction:@selector(SaveFile:)];
}

-(void)SaveFile:(NSString*)text{
	if (nil == text) 
		return;
	FileSystem *filesystem = [[FileSystem alloc]init];
	CrazyPainterAppDelegate *mainDelegate = (CrazyPainterAppDelegate *)[[UIApplication sharedApplication] delegate];
	[filesystem SaveStack:mainDelegate.commands toFile:[text stringByAppendingPathExtension:@"stack"]];
	[filesystem release];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event { 
	NSSet *arr = [event allTouches];
	for(UITouch *touch in arr){
	CreatePoint *command = [[CreatePoint alloc]initWithPoint:[touch locationInView:self.view]];
	@try{
		[self PushIt:command];
	}
	@finally {
		[command release];
	}
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
