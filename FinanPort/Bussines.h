//
//  Bussines.h
//  FinanPort
//
//  Created by Vega on 12/9/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Razon.h"
#import "FinanPortDAO.h"

@interface Bussines : NSObject

@property (nonatomic, retain) NSMutableArray *months;

- (NSMutableArray *) getMonths;
- (NSMutableArray *) getRazonesByMonth: (NSNumber *)month;

@end
