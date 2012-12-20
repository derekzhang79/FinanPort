//
//  CatalogoCuentaDAO.h
//  FinanPort
//
//  Created by Ariel Parra on 09/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CatalogoCuentas.h"

@interface CatalogoCuentaDAO : NSObject

@property (strong, nonatomic) NSFetchedResultsController * fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext     * managedObjectContext;
@property (retain, nonatomic) CatalogoCuentas            * catalogoCuenta;

- (id) initContext;
- (CatalogoCuentas *) getNewCatalogoCuenta;
- (NSArray *) getAllCuentas;
- (CatalogoCuentas *) getCatalogoCuentaByIndex: (int) index;

@end
