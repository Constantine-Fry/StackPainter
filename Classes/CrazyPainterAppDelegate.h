//
//  CrazyPainterAppDelegate.h
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright home 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Stack.h"
#import "Model.h"

@class CrazyPainterViewController;

@interface CrazyPainterAppDelegate : NSObject <UIApplicationDelegate> {
	Model *model_;
	Stack *commands_;
    UIWindow *window;
    CrazyPainterViewController *viewController;
	NSString *dataFile_;
}

-(void)ClearCommands;
@property(nonatomic,retain) Stack *commands;
@property (nonatomic,retain) Model* model;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CrazyPainterViewController *viewController;


@end

