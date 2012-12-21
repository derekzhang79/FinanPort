//
//  CatalogoValoresRazonesDAO.m
//  FinanPort
//
//  Created by Ariel Parra on 20/12/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import "CatalogoValoresRazonesDAO.h"

@implementation CatalogoValoresRazonesDAO

@synthesize valorRazon;

- (id) initContext
{
    if (self = [super init]) {
        id appDelegate = (id)[[UIApplication sharedApplication] delegate];
        self.managedObjectContext = [appDelegate managedObjectContext];
        
        NSLog(@"CatalogoValoresRazonesDAO método: initContext - contexto CoreData inicializado.");
    }
    return self;
}

- (ValorRazones *) getNewValorRazon
{
    valorRazon = [NSEntityDescription insertNewObjectForEntityForName:@"ValorRazones"
                                                       inManagedObjectContext:self.managedObjectContext];
    
    return valorRazon;
}

- (NSArray *) getAllValoresRazones
{
    NSLog(@"CatalogoValoresRazonesDAO método: getAllValoresRazones - Obteniendo todos los valores de las razones");
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"ValorRazones"
                                                  inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    NSError *error = nil;
    
    NSArray * allValoresRazones = [self.managedObjectContext executeFetchRequest:request error:&error];
    
    return allValoresRazones;
}

- (ValorRazones *) getValorRazonByIndex: (int) index
{
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"ValorRazones" inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    NSError *error = nil;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"(index = %d)", index];
    [request setPredicate:predicate];
    
    NSLog(@"CatalogoValoresRazonesDAO método: getValorRazonByIndex - Obteniendo un valor de una razón  a través de index: %d", index);
    
    return [[self.managedObjectContext executeFetchRequest:request error:&error] objectAtIndex:0];
}

@end
