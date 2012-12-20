//
//  CatalogoSectoresDAO.h
//  FinanPort
//
//  Created by Ariel Parra on 13/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CatalogoSectores.h"

@interface CatalogoSectoresDAO : NSObject

@property (strong, nonatomic) NSFetchedResultsController * fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext     * managedObjectContext;
@property (retain, nonatomic) CatalogoSectores           * catalogoSectores;

- (id) initContext;
- (CatalogoSectores *) getNewCatalogoSector;
- (NSArray *) getAllSectores;
- (CatalogoSectores *) getCatalogoSectorByIndex: (int) index;

@end
