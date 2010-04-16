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
	Shape *shape = nil;
	switch (type_) {
		case CIRCLE:{
			shape = [[Circle alloc]init];
			break;
		}
		case TRIANGLE:{
			shape = [[Polygon alloc]initTriangle];
			break;
		}				
		case FIVE:{
			shape = [[Polygon alloc]initPentagon];
			break;
		}
		default:
			break;
	}
	CrazyPainterAppDelegate *mainDelegate = (CrazyPainterAppDelegate *)[[UIApplication sharedApplication] delegate];
	//[mainDelegate.shapes Push:shape];
	//[mainDelegate.shapes addObject:shape];
	[mainDelegate.model AddShape:shape];
	[shape release];
}

-(void)Undo{
	CrazyPainterAppDelegate *mainDelegate = (CrazyPainterAppDelegate *)[[UIApplication sharedApplication] delegate];
	[mainDelegate.model RemoveLastShape];
//	Shape *shape = [mainDelegate.model.shapes lastObject];
//	[mainDelegate.model.points PushFromStack:[shape Flush]];
//	[mainDelegate.model.shapes removeLastObject];
}


@end
