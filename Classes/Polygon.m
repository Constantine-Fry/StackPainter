//
//  Triangle.m
//  CrazyPainter
//
//  Created by Fry Constantine on 11/6/09.
//  Copyright 2009 home. All rights reserved.
//

#import "Polygon.h"
#import "PairDot.h"

@implementation Polygon

- (id) initTriangle{
	self = [super init];
	if (self != nil) {
		type_ = 3;
	}
	return self;
}

- (id) initPentagon{
	self = [super init];
	if (self != nil) {
		type_ = 5;
	}
	return self;
}

-(void)DrawAtContext: (CGContextRef) context {
	for(PairDot *pair in pairDot_){
		[self DrawLineAtContext:context from:pair.one to:pair.two];
	}
	CGContextStrokePath(context);
}

@end
