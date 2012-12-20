//
//  CatalogoCuentaDAO.m
//  FinanPort
//
//  Created by Ariel Parra on 09/12/12.
//  Copyright (c) 2012 Itnovare.All rights reserved.
//

#import "CatalogoCuentaDAO.h"

@implementation CatalogoCuentaDAO

@synthesize catalogoCuenta;

// Método que es ejecutado para obtener el contexto del CoreData a través del delgado de la aplicación.
- (id) initContext
{
    if (self = [super init]) {
        id appDelegate = (id)[[UIApplication sharedApplication] delegate];
        self.managedObjectContext = [appDelegate managedObjectContext];
        
        NSLog(@"CatalogoCuenta método: initContext - contexto CoreData inicializado.");
    }
    return self;
}

- (CatalogoCuentas *) getNewCatalogoCuenta
{
    catalogoCuenta = [NSEntityDescription insertNewObjectForEntityForName:@"CatalogoCuentas"
                                                    inManagedObjectContext:self.managedObjectContext];
        
    return catalogoCuenta;
}

- (NSArray *) getAllCuentas
{
    NSLog(@"CatalogoCuentaDAO método: getAllCuentas - Obteniendo todas las cuentas del CSV");
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"CatalogoCuentas"
                                                  inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    NSError *error = nil;
    
    NSArray * catalogoCuentas = [self.managedObjectContext executeFetchRequest:request error:&error];
    
    return catalogoCuentas;
}

- (CatalogoCuentas *) getCatalogoCuentaByIndex: (int) index
{
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"CatalogoCuentas" inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    NSError *error = nil;

    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"(index = %d)", index];
    [request setPredicate:predicate];
    
    NSLog(@"CatalogoCuentaDAO método: getCatalogoCuentaByIndex - Obteniendo un catalogo cuenta a través de id: %d", index);
    
    return [[self.managedObjectContext executeFetchRequest:request error:&error] objectAtIndex:0];
}

@end
