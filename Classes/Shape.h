//
//  Shape.h
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright 2009 home. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Stack.h"
#import "Dot.h"


@interface Shape : NSObject {
	int type_;
	NSMutableArray* temp_;
	NSMutableArray* pairDot_;
}

@property (readonly) int Type;
@property (readonly) NSMutableArray* Dots;

-(BOOL)isFull;
-(void)DrawLineAtContext:(CGContextRef)context from:(Dot*)one to:(Dot*)two;
-(void)DrawAtContext: (CGContextRef) context;
-(void)EatThisDots:(Stack*)dots;
-(Stack*)Flush;
@end
