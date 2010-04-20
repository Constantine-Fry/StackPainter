//
//  CrazyPainterAppDelegate.m
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright home 2009. All rights reserved.
//

#import "CrazyPainterAppDelegate.h"
#import "CrazyPainterViewController.h"
#import "FileSystem.h"
#import "AbstractCommand.h"

@implementation CrazyPainterAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize commands = commands_;
@synthesize model = model_;



- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    // Override point for customization after app launch  

	dataFile_=  @"session.last";	
	model_ = [[Model alloc]init];
	
	FileSystem *filesystem = [[FileSystem alloc]init];
	self.commands = [filesystem ReadStackFromFile:dataFile_];
	[filesystem release];
	
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}

-(void)setCommands:(Stack*)stack{
	[self ClearCommands];
	[commands_ release];
	
	for(id<AbstractCommand> comm in stack.array)
		[comm Do];
	
	commands_ = [stack retain];
}

-(void)ClearCommands{
	id<AbstractCommand> command = [commands_ Pop];
	while (nil != command) {
		[command Undo];
		[(id) command release];
		command = [commands_ Pop];
	}
}

-(void)applicationWillTerminate:(UIApplication *)application{
	FileSystem *filesystem = [[FileSystem alloc]init];
	[filesystem SaveStack:commands_ toFile:dataFile_];
	[filesystem release];
}


- (void)dealloc {
	//	[points_ release];
	//	[shapes_ release];
	[commands_ release];
    [viewController release];
    [window release];
    [super dealloc];
}


@end
