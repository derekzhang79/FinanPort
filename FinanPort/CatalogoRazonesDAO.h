//
//  CatalogoRazonesDAO.h
//  FinanPort
//
//  Created by Ariel Parra on 13/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CatalogoRazones.h"

@interface CatalogoRazonesDAO : NSObject

@property (strong, nonatomic) NSFetchedResultsController * fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext     * managedObjectContext;
@property (retain, nonatomic) CatalogoRazones            * catalogoRazones;

- (id) initContext;
- (CatalogoRazones *) getNewCatalogoRazon;
- (NSArray *) getAllRazones;
- (CatalogoRazones *) getCatalogoRazonByIndex: (int) index;

@end
