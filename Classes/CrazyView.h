//
//  CrazyView.h
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright 2009 home. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShapeBar;
@interface CrazyView : UIView {
	ShapeBar *shapsBar_;
	UIColor *currentColor_;
	CGPoint touch_;
}

@end
