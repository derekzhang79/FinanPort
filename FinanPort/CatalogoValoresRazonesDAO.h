//
//  CatalogoValoresRazonesDAO.h
//  FinanPort
//
//  Created by Ariel Parra on 20/12/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ValorRazones.h"

@interface CatalogoValoresRazonesDAO : NSObject

@property (strong, nonatomic) NSFetchedResultsController * fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext     * managedObjectContext;
@property (retain, nonatomic) ValorRazones               * valorRazon;

- (id) initContext;
- (ValorRazones *) getNewValorRazon;
- (NSArray *) getAllValoresRazones;
- (ValorRazones *) getValorRazonByIndex: (int) index;

@end
