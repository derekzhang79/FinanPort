//
//  EstudioDAO.h
//  FinanPort
//
//  Created by Ariel Parra on 13/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Estudio.h"

@interface EstudioDAO : NSObject

@property (strong, nonatomic) NSFetchedResultsController * fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext     * managedObjectContext;
@property (retain, nonatomic) Estudio                    * estudio;

- (id) initContext;
- (Estudio *) getNewEstudio;
- (NSArray *) getAllEstudios;

@end
