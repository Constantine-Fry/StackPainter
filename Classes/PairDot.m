//
//  PairDot.m
//  CrazyPainter
//
//  Created by Constantine Fry on 3/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PairDot.h"


@implementation PairDot
@synthesize one,two;
- (id) initWithOne:(Dot*)o andTwo:(Dot*)t
{
	self = [super init];
	if (self != nil) {
		one = o;
		two = t;
	}
	return self;
}

@end
