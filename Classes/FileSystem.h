//
//  FileSystem.h
//  CrazyPainter
//
//  Created by Constantine Fry on 4/21/10.
//  Copyright 2010 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"


@interface FileSystem : NSObject {

}

-(void)SaveStack:(Stack*)stack toFile:(NSString*)filename;
-(Stack*)ReadStackFromFile:(NSString*)filename;
-(NSArray*)GetAllStacksInDocs;

@end
