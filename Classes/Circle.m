//
//  Circle.m
//  CrazyPainter
//
//  Created by Fry Constantine on 11/6/09.
//  Copyright 2009 home. All rights reserved.
//

#import "Circle.h"
#import "PairDot.h"

@implementation Circle

- (id) init{
	self = [super init];
	if (self != nil) {
		
		type_ = 2;
		//isFull_ = NO;
	}
	return self;
}


- (void)DrawAtContext: (CGContextRef) context{
	[super DrawAtContext:context];
	PairDot* pair = [pairDot_ objectAtIndex:0];
	Dot *notCenter = pair.one;
	Dot *center = pair.two;
	double d = sqrt((center.point.x - notCenter.point.x)*(center.point.x - notCenter.point.x)
					+ (center.point.y - notCenter.point.y)*(center.point.y - notCenter.point.y));
	CGRect rect = CGRectMake(center.point.x - d, center.point.y -d, d*2, d*2);
	CGContextAddEllipseInRect(context, rect);
	CGContextStrokePath(context);
}

@end
