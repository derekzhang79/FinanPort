//
//  CuentaPeriodoDAO.m
//  FinanPort
//
//  Created by Ariel Parra on 13/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import "CuentaPeriodoDAO.h"

@implementation CuentaPeriodoDAO

@synthesize cuentaPeriodo;

- (id) initContext
{
    if (self = [super init]) {
        id appDelegate = (id)[[UIApplication sharedApplication] delegate];
        self.managedObjectContext = [appDelegate managedObjectContext];
        
        NSLog(@"CuentaPeriodoDAO método: initContext - contexto CoreData inicializado.");
    }
    return self;
}

- (CuentaPeriodo *) getNewCuentaPeriodo;
{
    cuentaPeriodo = [NSEntityDescription insertNewObjectForEntityForName:@"CuentaPeriodo"
                                            inManagedObjectContext:self.managedObjectContext];
    
    return cuentaPeriodo;
}

- (NSArray *) getAllCuentasPeriodo
{
    NSLog(@"CuentaPeriodoDAO método: getAllCuentaPeriodos - Obteniendo todas las cuentas período existentes");
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"CuentaPeriodo"
                                                  inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    NSError *error = nil;
    
    NSArray * cuentasPeriodo = [self.managedObjectContext executeFetchRequest:request error:&error];
    
    NSLog(@"Total de las cuenta período: %d", [cuentasPeriodo count]);
    
    return cuentasPeriodo;
}

@end
