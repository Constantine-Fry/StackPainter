//
//  Model.m
//  CrazyPainter
//
//  Created by Constantine Fry on 4/3/10.
//  Copyright 2010 Home. All rights reserved.
//

#import "Model.h"


@interface Model(PrivateMessage)
-(void)RemoveLastPoint;
-(void)RemoveLastShape;
-(void)RemoveLastDrawShape;
-(void)Update;
@end

@implementation Model
@synthesize shapesForDraw = shapesForDraw_;


- (id) init
{
	self = [super init];
	if (self != nil) {
		shapes_ = [[Stack alloc]init];
		points_ = [[Stack alloc]init];
		shapesForDraw_ = [[NSMutableArray alloc]init];
	}
	return self;
}

- (void) dealloc
{
	[shapes_ release];
	[points_ release];
	[shapesForDraw_ release];
	[super dealloc];
}

-(int)PointCount{
	int a = 0;
	for(Shape *shape in shapesForDraw_)
		a += shape.Type;
	return ([points_ Count]+a);
}

-(NSArray*)pointForDraw{
	return points_.array;
}

-(NSArray*)shapesInStack{
	return shapes_.array;
}


#pragma mark Add

-(void)AddPoint:(Dot*)dot{
	[points_ Push:dot];
	[self Update];
}

-(void)AddShape:(Shape*)shape{
	[shapes_ Push:shape];
	[self Update];
}

#pragma mark Remove 

-(void)RemovePoint:(Dot*)dot{
	if (nil != dot.Parent) {
		[shapes_ Push: [shapesForDraw_ lastObject]];
		[shapesForDraw_ removeLastObject];
	}
	[points_ PushFromStack:[dot.Parent Flush]];
	[self RemoveLastPoint];
}

-(void)RemoveShape:(Shape*)shape{
	if ([shape isFull]) {
		[self RemoveLastDrawShape];
	}else{
		[self RemoveLastShape];
	}
}


#pragma mark PrivateMessage

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

-(void)RemoveLastDrawShape{
	Shape *shape = [shapesForDraw_ lastObject];
	[points_ PushFromStack:[shape Flush]];
	[shapesForDraw_ removeLastObject];
	[shape release];
}

@end
