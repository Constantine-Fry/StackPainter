//
//  Stack.m
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright 2009 home. All rights reserved.
//

#import "Stack.h"


@implementation Stack

- (id)init{
	self = [super init];
	if (self != nil) {
		array_ = [[NSMutableArray alloc]init];
	}
	return self;
}

- (void)dealloc{
	[array_ release];
	[super dealloc];
}

-(void)Push:(id)obj{
	if(nil != obj)
		[array_ addObject:obj];
}

-(void)PushFromStack:(Stack*)stack{
	id dot = [stack Pop];
	while (nil != dot) {
		[self Push:dot];
		dot = [stack Pop];
	}
}

-(id)Pop{
	if (0 != [array_ count]){
		id obj = [[array_ lastObject] retain];
		[array_ removeLastObject];
		return obj;
	} else {
		return nil;
	}
}

-(int)Count{
	return [array_ count];
}

@end
