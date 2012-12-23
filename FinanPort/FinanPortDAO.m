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
    NSString       *formula;
    NSArray        *formulas;
    
    
    razones = [[NSMutableArray alloc] init];
    
    razon = [[Razon alloc] init];
    [razon setTitulo:@"Razón del Capital del Trabajo"];
    [razon setSignificado:@"Capacidad de pago a corto plazo de la empresa e índice de solvencia."];
    [razon setLectura:@"Cada $1.00 de obligaciones a corto plazo, está garantizado con $%@ de efectivo y otros bienes, que en el curso normal de operaciones se transforma en efectivo."];
    
    formula = @"(0+1+2+3-4+5+6+7+8+9+10)/(24+25+26+27+28+29)";
    [razon setFormula:formula];
    
    formulas = [formula componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/"]];
    NSLog(@"FinanPort.getRazones: %@", formulas);
    for (int i = 0; i < [formulas count]; i++) {
        if (i == 0) {
            [razon setNumeradorFormula:[[formulas objectAtIndex:i] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"()"]]];
            [razon setTituloDelNumerador:@"Efectivo y Otros Bienes"];
        } else if (i == 1) {
            [razon setDenominadorFormula:[[formulas objectAtIndex:i] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"()"]]];
            [razon setTituloDelDenomidor:@"Obligaciones a Corto Plazo"];
        }
    }
    [razon setCondicionesSemaforoVerde:@"=2"];
    [razon setCondicionesSemaforoAmarillo:@">1&<2|>2"];
    [razon setCondicionesSemaforoRojo:@"<1"];

    [razones addObject:razon];
    
    razon = [[Razon alloc] init];
    [razon setTitulo:@"Razón del Margen de Seguridad"];
    [razon setSignificado:@"Muestra la realidad de las inversiones tanto de los acreedores a corto plazo, como la de los acreedores a largo plazo y propietarios."];
    [razon setLectura:@"Cada $1.00 de inversión en el activo circulante de los acreedores a corto plazo, los propietarios y acreedores a largo plazo invierten $%@."];
    
    formula = @"(0+1+2+3-4+5+6+7+8+9+10-25-26-27-28-29)/(24+25+26+27+28+29)";
    [razon setFormula:formula];
    
    formulas = [formula componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/"]];
    NSLog(@"FinanPort.getRazones: %@", formulas);
    for (int i = 0; i < [formulas count]; i++) {
        if (i == 0) {
            [razon setNumeradorFormula:[[formulas objectAtIndex:i] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"()"]]];
            [razon setTituloDelNumerador:@"Capital del Trabajo"];
        } else if (i == 1) {
            [razon setDenominadorFormula:[[formulas objectAtIndex:i] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"()"]]];
            [razon setTituloDelDenomidor:@"Pasivo Circulante"];
        }
    }
    [razon setCondicionesSemaforoVerde:@">=2"];
    [razon setCondicionesSemaforoAmarillo:@""];
    [razon setCondicionesSemaforoRojo:@"<1"];
    
    [razones addObject:razon];
    
    [razones addObject:razon];
    
    razon = [[Razon alloc] init];
    [razon setTitulo:@"Razón Severa o Prueba del Ácido"];
    [razon setSignificado:@"La suficiencia o insuficiencia de la empresa, para cubrir los pasivos a corto plazo, es decir la solvencia inmediata de la empresa."];
    [razon setLectura:@"Cada $1.00 de obligaciones a corto plazo, la empresa cuenta con $%@ centavos de activos."];
    
    formula = @"(0+1+2+3-4+5-6-7-8+9+10)/(24+25+26+27+28+29)";
    [razon setFormula:formula];
    
    formulas = [formula componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/"]];
    NSLog(@"FinanPort.getRazones: %@", formulas);
    for (int i = 0; i < [formulas count]; i++) {
        if (i == 0) {
            [razon setNumeradorFormula:[[formulas objectAtIndex:i] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"()"]]];
            [razon setTituloDelNumerador:@"Solvencia Inmediata"];
        } else if (i == 1) {
            [razon setDenominadorFormula:[[formulas objectAtIndex:i] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"()"]]];
            [razon setTituloDelDenomidor:@"Pasivo Circulante"];
        }
    }
    [razon setCondicionesSemaforoVerde:@">=1&<=2"];
    [razon setCondicionesSemaforoAmarillo:@">2"];
    [razon setCondicionesSemaforoRojo:@"<1"];
    
    [razones addObject:razon];
    
    razon = [[Razon alloc] init];
    [razon setTitulo:@"Razón de Protección al Pasivo Total"];
    [razon setSignificado:@"La protección que ofrecen los propietarios a los acreedores, la capacidad de crédito de la empresa o ¿quién controla la empresa, acreedores o propietarios?"];
    [razon setLectura:@"Los propietarios invierten $%@ en la empresa, por cada $1.00 de inversión de los acreedores."];
    
    formula = @"(33+58-22)/(24+25+26+27+28+29+30+31+32)";
    [razon setFormula:formula];
    
    formulas = [formula componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/"]];
    NSLog(@"FinanPort.getRazones: %@", formulas);
    for (int i = 0; i < [formulas count]; i++) {
        if (i == 0) {
            [razon setNumeradorFormula:[[formulas objectAtIndex:i] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"()"]]];
            [razon setTituloDelNumerador:@"Capital Contable Tangible"];
        } else if (i == 1) {
            [razon setDenominadorFormula:[[formulas objectAtIndex:i] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"()"]]];
            [razon setTituloDelDenomidor:@"Pasivo Total"];
        }
    }
    [razon setCondicionesSemaforoVerde:@">=1"];
    [razon setCondicionesSemaforoAmarillo:@""];
    [razon setCondicionesSemaforoRojo:@"<1"];
    
    [razones addObject:razon];
    
    razon = [[Razon alloc] init];
    [razon setTitulo:@"Razón de Protección al Pasivo Circulante"];
    [razon setSignificado:@"Protección o garantía que ofrecen los propietarios a los acreedores a corto plazo."];
    [razon setLectura:@"Los propietarios invierten $%@ por cada $1.00 de inversión de los acreedores al corto Plazo."];
    
    formula = @"(33+58-22)/(24+25+26+27+28+29)";
    [razon setFormula:formula];
    
    formulas = [formula componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/"]];
    NSLog(@"FinanPort.getRazones: %@", formulas);
    for (int i = 0; i < [formulas count]; i++) {
        if (i == 0) {
            [razon setNumeradorFormula:[[formulas objectAtIndex:i] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"()"]]];
            [razon setTituloDelNumerador:@"Capital Contable Tangible"];
        } else if (i == 1) {
            [razon setDenominadorFormula:[[formulas objectAtIndex:i] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"()"]]];
            [razon setTituloDelDenomidor:@"Pasivo Circulante"];
        }
    }
    [razon setCondicionesSemaforoVerde:@""];
    [razon setCondicionesSemaforoAmarillo:@""];
    [razon setCondicionesSemaforoRojo:@""];
    
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
