//
//  PreviewFactory.m
//  CrazyPainter
//
//  Created by Fry Constantine on 11/7/09.
//  Copyright 2009 home. All rights reserved.
//

#import "PreviewFactory.h"


@implementation PreviewFactory
static NSMutableDictionary *dic;

- (id) init{
	self = [super init];
	if (self != nil) {
		if(dic == nil){
			dic = [[NSMutableDictionary alloc]init];
			NSArray *arr2 = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"circle.png"],[UIImage imageNamed:@"circle_full.png"],nil];
			NSArray *arr3 = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"triangle.png"],[UIImage imageNamed:@"triangle_full.png"],nil];
			NSArray *arr5 = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"pentagon.png"],[UIImage imageNamed:@"pentagon_full.png"],nil];
			[dic setObject:arr2 forKey:[NSNumber numberWithInt:2]];
			[dic setObject:arr3 forKey:[NSNumber numberWithInt:3]];
			[dic setObject:arr5 forKey:[NSNumber numberWithInt:5]];
			[arr2 release];
			[arr3 release];
			[arr5 release];
		}
	}
	return self;
}
- (void) dealloc
{
	[dic release];
	[super dealloc];
}


-(UIImage*)GetImageByShape:(Shape*)shape{
	NSArray *arr = [dic objectForKey:[NSNumber numberWithInt:shape.Type]];
	return [arr objectAtIndex:[shape isFull]];;
}
@end
