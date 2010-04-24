//
//  CreatePoint.m
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright 2009 home. All rights reserved.
//

#import "CreatePoint.h"
#import "Dot.h"
#import "Poof.h"


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
	[mainDelegate.model AddPoint:point_];
}

-(void)Undo{
	CrazyPainterAppDelegate *mainDelegate = (CrazyPainterAppDelegate *)[[UIApplication sharedApplication] delegate];
	[mainDelegate.model RemovePoint:point_];
	Poof *poofView = [[Poof alloc]initWithCenter:point_.point];
	[[mainDelegate.window.subviews objectAtIndex:0] addSubview:poofView] ;
	[poofView release];
}


// -----------------------------------------------------------------------------
#pragma mark NSCoding
// -----------------------------------------------------------------------------

- (id)initWithCoder:(NSCoder *)decoder
{
	//[super init];
	point_ = [[decoder decodeObjectForKey:@"point_"] retain];
	//[self Do];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeObject:point_ forKey:@"point_"];
}


@end
