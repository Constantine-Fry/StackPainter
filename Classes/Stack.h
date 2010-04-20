//
//  Stack.h
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright 2009 home. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Stack;
@interface Stack : NSObject<NSCoding> {
	NSMutableArray *array_;
}

@property (readonly) NSMutableArray *array;
-(int)Count;
-(void)Push:(id)obj;
-(void)PushFromStack:(Stack*)stack;
-(id)Pop;
@end
