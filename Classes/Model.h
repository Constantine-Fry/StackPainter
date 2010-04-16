//
//  Model.h
//  CrazyPainter
//
//  Created by Constantine Fry on 4/3/10.
//  Copyright 2010 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"
#import "Dot.h"
#import "Shape.h"

@interface Model : NSObject {
	Stack *points_;
	Stack *shapes_;
	NSMutableArray* shapesForDraw_;
}

@property (retain,nonatomic) NSMutableArray * shapesForDraw;
@property (readonly) NSArray * pointForDraw;
@property (readonly) NSArray * shapesInStack;
-(void)AddPoint:(Dot*)dot;
-(void)AddShape:(Shape*)shape;
-(void)RemovePoint:(Dot*)dot;
-(void)RemoveShape:(Shape*)shape;
-(int)PointCount;
@end


