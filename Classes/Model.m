//
//  Model.m
//  CrazyPainter
//
//  Created by Constantine Fry on 4/3/10.
//  Copyright 2010 Home. All rights reserved.
//

#import "Model.h"


@implementation Model
@synthesize points = points_;
@synthesize shapes = shapes_;


- (id) init
{
	self = [super init];
	if (self != nil) {
		shapes_ = [[NSMutableArray alloc]init];
		points_ = [[Stack alloc]init];
	}
	return self;
}

- (void) dealloc
{
	[shapes_ release];
	[points_ release];
	[super dealloc];
}


-(void)AddPoint:(Dot*)dot{
	[points_ Push:dot];
	[self Update];
}

-(void)AddShape:(Shape*)shape{
	[shapes_ Push:shape];
	[self Update];
}

-(void)Update{
	Shape *sh = [shapes_ Pop];
	[sh EatThisDots:points_];
	if ([sh isFull]) {
		[shapesForDraw_ addObject:sh];
		[sh release];
	}else {
		[shapes_ Push:sh];
	}
}

-(void)RemoveLastPoint{
	Dot* dot = [points_ Pop];
	[dot release];
}

-(void)RemoveLastShape{
	Shape *shape = [shapes_ Pop];
	[points_ PushFromStack:[shape Flush]];
	[shape release];
}

@end
