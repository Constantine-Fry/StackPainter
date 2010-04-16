//
//  Shape.m
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright 2009 home. All rights reserved.
//

#import "Shape.h"
#import "PairDot.h"

@implementation Shape
@synthesize Type = type_;

@synthesize Dots = temp_;

- (id)init{
	self = [super init];
	if (self != nil) {
		temp_ = [[NSMutableArray alloc]init];
		pairDot_ = nil;
	}
	return self;
}

- (void)dealloc{
	[temp_ release];
	[pairDot_ release];
	[super dealloc];
}

-(BOOL)isFull{
	return (type_ == [temp_ count]);
}



-(void)DotsToPair:(Stack*)dots{
	pairDot_ = [[NSMutableArray alloc]init];
	for(int i = 0;i<[temp_ count]-1	;i++){
		Dot* one = [temp_ objectAtIndex:i];
		Dot* two = [temp_ objectAtIndex:i+1];
		PairDot *pair = [[PairDot alloc]initWithOne:one andTwo:two];
		[pairDot_ addObject:pair];
		[pair release];
	}

	
	Dot* one = [temp_ objectAtIndex:0];
	Dot* two = [temp_ lastObject];
	PairDot *pair = [[PairDot alloc]initWithOne:one andTwo:two];
	[pairDot_ addObject:pair];
	[pair release];
}

-(Shape*)EatThisDots:(Stack*)dots{
	if(([self isFull] == YES)){
		return nil;
	}
	
	if ([self Type] > [dots Count]) {
		return nil;
	}
	
	Dot *dot = [dots Pop];
	while(dot != nil){
		[temp_ addObject:dot];
		dot.Parent = self;
		[dot release];
		if([self isFull] == YES){
			[self DotsToPair:dots];
			break;
		}
		dot = [dots Pop];
	}
	return nil;
}

-(void)DrawLineAtContext:(CGContextRef)context from:(Dot*)one to:(Dot*)two{
	if(one != nil && two != nil){
		CGContextMoveToPoint(context, one.point.x, one.point.y);
		CGContextAddLineToPoint(context, two.point.x, two.point.y);
		return;
	}
	if(two == nil){
		[one DrawAtContext:context];
		return;
	}
	
}

-(Stack*)Flush{
	//isFull_ = NO;
//	[pairDot_ removeAllObjects];
	[pairDot_ release];
	pairDot_ = nil;
	Stack *stack = [[Stack alloc]init];
	for(Dot *dot in temp_){
		dot.Parent = nil;
		[stack Push:dot];
	}
	[temp_ removeAllObjects];
	return [stack autorelease];
}
-(void)DrawAtContext: (CGContextRef) context{
	if([self isFull] == NO)
		for(Dot* dot in temp_)
			[dot DrawAtContext:context];
}
@end
