//
//  AbstractCommand.h
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright 2009 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CrazyPainterAppDelegate.h"

@protocol AbstractCommand
-(void)Do;
-(void)Undo;
@end
