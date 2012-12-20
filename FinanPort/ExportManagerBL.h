//
//  ExportManagerBL.h
//  FinanPort
//
//  Created by Ariel Parra on 19/12/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExportManagerBL : NSObject

@property (retain, nonatomic) UIImage * screenshoot;

- (UIImage *) takeScreenshoot:(UIView *) view;

@end
