//
//  CrazyPainterAppDelegate.m
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright home 2009. All rights reserved.
//

#import "CrazyPainterAppDelegate.h"
#import "CrazyPainterViewController.h"

@implementation CrazyPainterAppDelegate

@synthesize window;
@synthesize viewController;
//@synthesize points = points_;
//@synthesize shapes = shapes_;
@synthesize commands = commands_;
@synthesize model = model_;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch  
//	points_ = [[Stack alloc]init];
//	shapes_ = [[NSMutableArray alloc]init];
	commands_ = [[Stack alloc]init];
	model_ = [[Model alloc]init];
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
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
