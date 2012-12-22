//
//  ExportManagerBL.m
//  FinanPort
//
//  Created by Ariel Parra on 19/12/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import "ExportManagerBL.h"
#import <QuartzCore/QuartzCore.h>

@implementation ExportManagerBL

@synthesize screenshoot;

- (UIImage *) takeScreenshoot:(UIView *) view
{
    NSLog(@"Width view: %f, Height view: %f", view.bounds.size.width, view.bounds.size.height);
    CGRect contextRect  = CGRectMake(0, 0, view.bounds.size.height, view.bounds.size.width);
    UIGraphicsBeginImageContext(contextRect.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *data = UIImagePNGRepresentation(viewImage);
    screenshoot   = [[UIImage alloc] initWithData:data];
    
    return screenshoot;
}

@end
