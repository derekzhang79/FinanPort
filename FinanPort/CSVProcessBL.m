//
//  CSVProcessBL.m
//  FinanPort
//
//  Created by Ariel Parra on 10/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import "CSVProcessBL.h"

@implementation CSVProcessBL

@synthesize catalogoCuentaDAO;
@synthesize cuentaPeriodoDAO;
@synthesize estudioDAO;

-(void) processCSVFile:(NSArray *) cuentas
{
    estudioDAO = [[EstudioDAO alloc] initContext];
    Estudio * estudio = [estudioDAO getNewEstudio];
    
    estudio.fecha = [NSDate date];
    estudio.nombre = @"";
    
    catalogoCuentaDAO = [[CatalogoCuentaDAO alloc] initContext];
    cuentaPeriodoDAO  = [[CuentaPeriodoDAO alloc] initContext];
    
    for(int periodo=1; periodo<=13; periodo++) {
        if([cuentas count] == [[catalogoCuentaDAO getAllCuentas] count]) {
            for(int i=0; i<[cuentas count]; i++) {
                CatalogoCuentas *catalogoCuentas = [catalogoCuentaDAO getCatalogoCuentaByIndex:i];
                CuentaPeriodo *cuentaPeriodo = [cuentaPeriodoDAO getNewCuentaPeriodo];
                cuentaPeriodo.periodo = [NSNumber numberWithInt:periodo];
                cuentaPeriodo.valor = [NSNumber numberWithDouble:[[[cuentas objectAtIndex:i] objectAtIndex:periodo] doubleValue]];
                cuentaPeriodo.estudio = estudio;
                cuentaPeriodo.catalogo = catalogoCuentas;
            }
        }
    }
}

@end
