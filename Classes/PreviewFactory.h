//
//  PreviewFactory.h
//  CrazyPainter
//
//  Created by Fry Constantine on 11/7/09.
//  Copyright 2009 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"

@interface PreviewFactory : NSObject {

}

-(UIImage*)GetImageByShape:(Shape*)shape;

@end
