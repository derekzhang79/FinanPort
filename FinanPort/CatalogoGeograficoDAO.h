//
//  CatalogoGeograficoDAO.h
//  FinanPort
//
//  Created by Ariel Parra on 13/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CatalogoGeografico.h"

@interface CatalogoGeograficoDAO : NSObject

@property (strong, nonatomic) NSFetchedResultsController * fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext     * managedObjectContext;
@property (retain, nonatomic) CatalogoGeografico         * catalogoGeografico;

- (id) initContext;
- (CatalogoGeografico *) getNewCatalogoGeografico;
- (NSArray *) getAllPaises;
- (CatalogoGeografico *) getCatalogoGeograficoByIndex: (int) index;

@end
