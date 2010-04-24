//
//  FileSystem.m
//  CrazyPainter
//
//  Created by Constantine Fry on 4/21/10.
//  Copyright 2010 Home. All rights reserved.
//

#import "FileSystem.h"


@implementation FileSystem


-(void)SaveStack:(Stack*)stack toFile:(NSString*)filename{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDir = [paths objectAtIndex:0];
	NSString *path = [docDir stringByAppendingPathComponent:filename];
	
	NSMutableData *data = [NSMutableData data];
	NSKeyedArchiver *encoder = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
	[encoder encodeObject:stack forKey:@"stack"];
	[encoder finishEncoding];
	[data writeToFile:path atomically:YES];
	[encoder release];
}

-(Stack*)ReadStackFromFile:(NSString*)filename{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDir = [paths objectAtIndex:0];
	NSString *path = [docDir stringByAppendingPathComponent:filename];
	Stack *stack;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if ([fileManager fileExistsAtPath:path]) {
		NSMutableData *theData = [NSMutableData dataWithContentsOfFile:path];
		NSKeyedUnarchiver *decoder = [[NSKeyedUnarchiver alloc]initForReadingWithData:theData];
		stack  = [[decoder decodeObjectForKey:@"stack"]retain];
		[decoder finishDecoding];
		[decoder release];}
	else {
		stack = [[Stack alloc]init];
	}
	return stack;
}

-(NSArray*)GetAllStacksInDocs{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDir = [paths objectAtIndex:0];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSArray *files = [fileManager contentsOfDirectoryAtPath:docDir error:NULL];
	NSMutableArray* stackList= [[NSMutableArray alloc]init];
	for(NSString *name in files)
		if([name rangeOfString:@".stack"].length != 0)
			[stackList addObject:[name stringByDeletingPathExtension]];
	return [stackList autorelease];
					
}

@end
