//
//  FinanPortDAO.m
//  FinanPort
//
//  Created by Vega on 12/19/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import "FinanPortDAO.h"
#import "Razon.h"

@implementation FinanPortDAO


- (NSMutableArray *)getRazones {
    Razon          *razon;
    NSMutableArray *razones;
    
    razones = [[NSMutableArray alloc] init];
    
    razon = [[Razon alloc] init];
    [razon setTitulo:@"Razón del Capital del Trabajo"];
    [razon setSignificado:@"Capacidad de pago a corto plazo de la empresa e índice de solvencia."];
    [razon setLectura:@"Cada $1.00 de obligaciones a corto plazo, está garantizado con $%@ de efectivo y otros bienes, que en el curso normal de operaciones se transforma en efectivo."];
    [razon setNumeradorFormula:@"0+1+2+3-4+5+6+7+8+9+10"];
    [razon setTituloDelNumerador:@"Efectivo y Otros Bienes"];
    [razon setDenominadorFormula:@"24+25+26+27+28+29"];
    [razon setTitulo:@"Obligaciones a Corto Plazo"];
    [razones addObject:razon];
    
    return razones;
}

- (NSMutableArray *)getCuentasByMonths: (NSNumber *)month {
    NSNumber       *temp;
    NSMutableArray *cuentas;
    
    cuentas = [[NSMutableArray alloc] init];
    
    for (int i=0; i <= 67; i++) {
        temp = [[NSNumber alloc] initWithInt:(rand() % (100 - 1) + 1)];
        [cuentas addObject:temp];
    }
    
    return cuentas;
}

@end
