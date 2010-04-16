//
//  CreatePoint.m
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright 2009 home. All rights reserved.
//

#import "CreatePoint.h"
#import "Dot.h"

@implementation CreatePoint

- (id) initWithPoint:(CGPoint)point{
	self = [super init];
	if (self != nil) {
		point_ = [[Dot alloc]initWithPoint:point];
	}
	return self;
}

- (void) dealloc
{
	[point_ release];
	[super dealloc];
}



-(void)Do{
	CrazyPainterAppDelegate *mainDelegate = (CrazyPainterAppDelegate *)[[UIApplication sharedApplication] delegate];
	//[mainDelegate.points Push:point_];
	//Shape *shape = [mainDelegate.shapes lastObject];
	//[shape EatThisDots:mainDelegate.points];
	[mainDelegate.model AddPoint:point_];
}

-(void)Undo{
	CrazyPainterAppDelegate *mainDelegate = (CrazyPainterAppDelegate *)[[UIApplication sharedApplication] delegate];
	[mainDelegate.model.points PushFromStack:[point_.Parent Flush]];
	[mainDelegate.model RemoveLastPoint];
	//[mainDelegate.points removeLastObject];
}


@end
