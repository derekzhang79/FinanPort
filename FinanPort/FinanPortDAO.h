//
//  FinanPortDAO.h
//  FinanPort
//
//  Created by Vega on 12/19/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FinanPortDAO : NSObject

- (NSMutableArray *)getRazones;
- (NSMutableArray *)getCuentasByMonths: (NSNumber *)month;

@end
