//
//  CreateCircle.m
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright 2009 home. All rights reserved.
//

#import "CreateShape.h"
#import "Shape.h"
#import "Circle.h"
#import "Polygon.h"


#define CIRCLE 2
#define TRIANGLE 3
#define FIVE 5

@implementation CreateShape

- (id) initCircleCreator{
	self = [super init];
	if (self != nil) {
		type_ = CIRCLE;
	}
	return self;
}

- (id) initTriangleCreator{
	self = [super init];
	if (self != nil) {
		type_ = TRIANGLE;
	}
	return self;
}

- (id) initPentagonCreator{
	self = [super init];
	if (self != nil) {
		type_ = FIVE;
	}
	return self;
}

-(void)Do{
	switch (type_) {
		case CIRCLE:{
			shape_ = [[Circle alloc]init];
			break;
		}
		case TRIANGLE:{
			shape_ = [[Polygon alloc]initTriangle];
			break;
		}				
		case FIVE:{
			shape_ = [[Polygon alloc]initPentagon];
			break;
		}
		default:
			break;
	}
	CrazyPainterAppDelegate *mainDelegate = (CrazyPainterAppDelegate *)
	[[UIApplication sharedApplication] delegate];
	[mainDelegate.model AddShape:shape_];
}

-(void)Undo{
	CrazyPainterAppDelegate *mainDelegate = (CrazyPainterAppDelegate *)
	[[UIApplication sharedApplication] delegate];
	[mainDelegate.model RemoveShape:shape_];
	
}


@end
