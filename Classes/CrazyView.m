//
//  CrazyView.m
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright 2009 home. All rights reserved.
//

#import "CrazyView.h"
#import "CrazyPainterAppDelegate.h"
#import "Stack.h"
#import "Dot.h"
#import "Shape.h"
#import "ShapeBar.h"

@implementation CrazyView


- (void)willMoveToWindow:(UIWindow *)newWindow{
	if(nil == currentColor_ )
		currentColor_ = [UIColor whiteColor];
	if(nil == shapsBar_ ){
		CrazyPainterAppDelegate *mainDelegate = (CrazyPainterAppDelegate *)[[UIApplication sharedApplication] delegate];		
		shapsBar_ = [[ShapeBar alloc]initWithShapes:mainDelegate.model.shapesInStack andFrame:CGRectMake(0, 0, 320, 15)];
		[self addSubview:shapsBar_];
	}
}

- (void)DrawPointCount: (CGContextRef) context  {
	CrazyPainterAppDelegate *mainDelegate = (CrazyPainterAppDelegate *)[[UIApplication sharedApplication] delegate];
	CGContextTranslateCTM(context, 0, self.bounds.size.height);
	CGContextScaleCTM(context, 1, -1);
	CGContextSelectFont (context, "Helvetica", 30, kCGEncodingMacRoman);
	CGContextSetTextDrawingMode( context, kCGTextFillStroke );
	NSNumber *num = [NSNumber numberWithInt:[mainDelegate.model PointCount]];
	NSString *str =[num stringValue];
	CGContextShowTextAtPoint (context, 280, 410, [str UTF8String], [str length]);
}

-(void)DrawShapes:(CGContextRef)context{
	CrazyPainterAppDelegate *mainDelegate = 
	(CrazyPainterAppDelegate *)[[UIApplication sharedApplication] delegate];
	for(Shape* shape in mainDelegate.model.shapesForDraw){
		[shape DrawAtContext:context];
	}
}

-(void)DrawPoints:(CGContextRef)context{
	CrazyPainterAppDelegate *mainDelegate = 
	(CrazyPainterAppDelegate *)[[UIApplication sharedApplication] delegate];
	for(Dot *dot in mainDelegate.model.pointForDraw)
		[dot DrawAtContext:context];
	CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)drawRect:(CGRect)rect {	
	CGContextRef context = UIGraphicsGetCurrentContext(); 
	CGContextSetLineWidth(context, 2.0);
	CGContextSetStrokeColorWithColor(context, currentColor_.CGColor);
	[self DrawShapes:context];
	[self DrawPoints:context];
	[self DrawPointCount: context];
	[shapsBar_ Redraw];
}

- (void)dealloc {
	[shapsBar_ release];
	[super dealloc];
}




@end
