//
//  CreateCircle.h
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright 2009 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractCommand.h"

@interface CreateShape : NSObject<AbstractCommand> {
	int type_;
}

- (id) initCircleCreator;
- (id) initTriangleCreator;
- (id) initPentagonCreator;

@end
