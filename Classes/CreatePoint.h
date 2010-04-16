//
//  CreatePoint.h
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright 2009 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractCommand.h"
@class Dot;
@interface CreatePoint : NSObject<AbstractCommand> {
	Dot* point_;
}
- (id) initWithPoint:(CGPoint)point;
@end
