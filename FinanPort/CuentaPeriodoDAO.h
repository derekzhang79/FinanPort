//
//  CuentaPeriodoDAO.h
//  FinanPort
//
//  Created by Ariel Parra on 13/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CuentaPeriodo.h"

@interface CuentaPeriodoDAO : NSObject

@property (strong, nonatomic) NSFetchedResultsController * fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext     * managedObjectContext;
@property (retain, nonatomic) CuentaPeriodo              * cuentaPeriodo;

- (id) initContext;
- (CuentaPeriodo *) getNewCuentaPeriodo;
- (NSArray *) getAllCuentasPeriodo;

@end
