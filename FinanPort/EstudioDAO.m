//
//  EstudioDAO.m
//  FinanPort
//
//  Created by Ariel Parra on 13/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import "EstudioDAO.h"

@implementation EstudioDAO

@synthesize estudio;

// Método que es ejecutado para obtener el contexto del CoreData a través del delgado de la aplicación.
- (id) initContext
{
    if (self = [super init]) {
        id appDelegate = (id)[[UIApplication sharedApplication] delegate];
        self.managedObjectContext = [appDelegate managedObjectContext];
        
        NSLog(@"EstudioDAO método: initContext - contexto CoreData inicializado.");
    }
    return self;
}

- (Estudio *) getNewEstudio
{    
    estudio = [NSEntityDescription insertNewObjectForEntityForName:@"Estudio"
                                                   inManagedObjectContext:self.managedObjectContext];
    
    return estudio;
}

- (NSArray *) getAllEstudios
{
    NSLog(@"EstudioDAO método: getAllEstudios - Obteniendo todos los estudios existentes");
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Estudio"
                                                  inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    NSError *error = nil;
    
    NSArray * estudios = [self.managedObjectContext executeFetchRequest:request error:&error];
    
    NSLog(@"Total de los estudios: %d", [estudios count]);
    
    return estudios;
}


@end
