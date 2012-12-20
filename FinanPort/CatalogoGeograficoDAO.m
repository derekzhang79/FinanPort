//
//  CatalogoGeograficoDAO.m
//  FinanPort
//
//  Created by Ariel Parra on 13/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import "CatalogoGeograficoDAO.h"

@implementation CatalogoGeograficoDAO

@synthesize catalogoGeografico;

- (id) initContext
{
    if (self = [super init]) {
        id appDelegate = (id)[[UIApplication sharedApplication] delegate];
        self.managedObjectContext = [appDelegate managedObjectContext];
        
        NSLog(@"CatalogoGeograficoDAO método: initContext - contexto CoreData inicializado.");
    }
    return self;
}

- (CatalogoGeografico *) getNewCatalogoGeografico
{
    catalogoGeografico = [NSEntityDescription insertNewObjectForEntityForName:@"CatalogoGeografico"
                                                     inManagedObjectContext:self.managedObjectContext];
    
    return catalogoGeografico;
}

- (NSArray *) getAllPaises
{
    NSLog(@"CatalogoGeograficoDAO método: getAllPaises - Obteniendo todos los países");
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"CatalogoGeografico"
                                                  inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    NSError *error = nil;
    
    NSArray * allCatalogoGeografico = [self.managedObjectContext executeFetchRequest:request error:&error];
    
    return allCatalogoGeografico;
}

- (CatalogoGeografico *) getCatalogoGeograficoByIndex: (int) index
{
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"CatalogoGeografico" inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    NSError *error = nil;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"(index = %d)", index];
    [request setPredicate:predicate];
    
    NSLog(@"CatalogoGeograficoDAO método: getCatalogoGeograficoByIndex - Obteniendo un catalogo geográfico a través de index: %d", index);
    
    return [[self.managedObjectContext executeFetchRequest:request error:&error] objectAtIndex:0];
}

@end
