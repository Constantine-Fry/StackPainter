//
//  PairDot.h
//  CrazyPainter
//
//  Created by Constantine Fry on 3/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dot.h"

@interface PairDot : NSObject {
	Dot* one;
	Dot* two;
}
- (id) initWithOne:(Dot*)o andTwo:(Dot*)t;
@property (nonatomic,assign) Dot* one;
@property (nonatomic,assign) Dot* two;
@end
