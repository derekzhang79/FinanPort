//
//  MonthChooserViewController.h
//  FinanPort
//
//  Created by Vega on 12/10/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bussines.h"

@protocol MonthChooserDelegate

- (void)didSelectMonth;

@end

@interface MonthChooserViewController : UITableViewController

@property (nonatomic, retain) NSMutableArray *months;
@property (nonatomic, retain) NSIndexPath *monthIndexPath;

@property (nonatomic, retain)id <MonthChooserDelegate> delegate;

@end
