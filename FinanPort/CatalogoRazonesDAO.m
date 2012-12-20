//
//  CatalogoRazonesDAO.m
//  FinanPort
//
//  Created by Ariel Parra on 13/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import "CatalogoRazonesDAO.h"

@implementation CatalogoRazonesDAO

@synthesize catalogoRazones;

- (id) initContext
{
    if (self = [super init]) {
        id appDelegate = (id)[[UIApplication sharedApplication] delegate];
        self.managedObjectContext = [appDelegate managedObjectContext];
        
        NSLog(@"CatalogoRazonesDAO método: initContext - contexto CoreData inicializado.");
    }
    return self;
}

- (CatalogoRazones *)getNewCatalogoRazon
{
    catalogoRazones = [NSEntityDescription insertNewObjectForEntityForName:@"CatalogoRazones"
                                                   inManagedObjectContext:self.managedObjectContext];
    
    return catalogoRazones;
}

- (NSArray *) getAllRazones
{
    NSLog(@"CatalogoRazonesDAO método: getAllRazones - Obteniendo todas las razones");
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"CatalogoRazones"
                                                  inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    NSError *error = nil;
    
    NSArray * allCatalogoRazones = [self.managedObjectContext executeFetchRequest:request error:&error];
    
    return allCatalogoRazones;
}

- (CatalogoRazones *) getCatalogoRazonByIndex: (int) index
{
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"CatalogoRazones" inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    NSError *error = nil;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"(index = %d)", index];
    [request setPredicate:predicate];
    
    NSLog(@"CatalogoRazonesDAO método: getCatalogoRazonByIndex - Obteniendo un catalogo razón a través de index: %d", index);
    
    return [[self.managedObjectContext executeFetchRequest:request error:&error] objectAtIndex:0];
}

@end
