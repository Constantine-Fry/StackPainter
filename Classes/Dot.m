//
//  Point.m
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright 2009 home. All rights reserved.
//

#import "Dot.h"



@implementation Dot
@synthesize point = point_;
@synthesize Parent = parent_;

- (id) initWithPoint:(CGPoint)point{
	self = [super init];
	if (self != nil) {
		point_ = point;
	}
	return self;
}

-(void)DrawAtContext:(CGContextRef)context {
	CGContextAddRect(context, CGRectMake(point_.x, point_.y,0.3,0.3)); 
	
}

@end
