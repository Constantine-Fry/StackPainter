//
//  CrazyPainterViewController.h
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright home 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateShape.h"
#import "CreatePoint.h"

@interface CrazyPainterViewController : UIViewController {

}
-(void)PushIt:(id<AbstractCommand>)creator;
-(IBAction)TwoClick;
-(IBAction)ThreeClick;
-(IBAction)FiveClick;
-(IBAction)UndoClick;
@end

