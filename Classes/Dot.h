//
//  Point.h
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright 2009 home. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Shape;
@interface Dot : NSObject {
	CGPoint point_;
	Shape* parent_;
}

@property CGPoint point;
@property (nonatomic,assign) Shape* Parent;
- (id) initWithPoint:(CGPoint)point;
- (void) DrawAtContext: (CGContextRef) context;
@end
