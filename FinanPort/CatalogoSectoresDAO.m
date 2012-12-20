//
//  CatalogoSectoresDAO.m
//  FinanPort
//
//  Created by Ariel Parra on 13/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import "CatalogoSectoresDAO.h"

@implementation CatalogoSectoresDAO

@synthesize catalogoSectores;

- (id) initContext
{
    if (self = [super init]) {
        id appDelegate = (id)[[UIApplication sharedApplication] delegate];
        self.managedObjectContext = [appDelegate managedObjectContext];
        
        NSLog(@"CatalogoSectoresDAO método: initContext - contexto CoreData inicializado.");
    }
    return self;
}

- (CatalogoSectores *) getNewCatalogoSector
{
    catalogoSectores = [NSEntityDescription insertNewObjectForEntityForName:@"CatalogoSectores"
                                                    inManagedObjectContext:self.managedObjectContext];
    
    return catalogoSectores;
}

- (NSArray *) getAllSectores
{
    NSLog(@"CatalogoSectoresDAO método: getAllSectores - Obteniendo todos los sectores");
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"CatalogoSectores"
                                                  inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    NSError *error = nil;
    
    NSArray * allCatalogoSectores = [self.managedObjectContext executeFetchRequest:request error:&error];
    
    return allCatalogoSectores;
}

- (CatalogoSectores *) getCatalogoSectorByIndex: (int) index
{
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"CatalogoRazones" inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    NSError *error = nil;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"(index = %d)", index];
    [request setPredicate:predicate];
    
    NSLog(@"CatalogoSectoresDAO método: getCatalogoRazonByIndex - Obteniendo un catalogo sector a través de index: %d", index);
    
    return [[self.managedObjectContext executeFetchRequest:request error:&error] objectAtIndex:0];
}

@end
