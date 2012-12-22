//
//  Bussines.m
//  FinanPort
//
//  Created by Vega on 12/9/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import "Bussines.h"

@implementation Bussines

@synthesize months;

- (NSMutableArray *)months {
    months = [[NSMutableArray alloc] initWithObjects:@"Enero", @"Febrero", @"Marzo", @"Abril", @"Mayo", @"Junio", @"Julio", @"Agosto", @"Septiembre", @"Octubre", @"Noviembre", @"Diciembre", @"Anual", nil];
    
    //NSLog(@"months %@",[months objectAtIndex:0]);
    return months;
}

- (NSMutableArray *) getRazonesByMonth: (NSNumber *)month{
    NSMutableArray *razones;
    NSMutableArray *cuentas;
    FinanPortDAO   *finanPortDAO;
    
    finanPortDAO = [[FinanPortDAO alloc] init];
    
    razones = [finanPortDAO getRazones];
    cuentas = [finanPortDAO getCuentasByMonths:month];
    
    //NSLog(@"[razones count] %d", [razones count]);
    
    for (int i=0; i < [razones count]; i++) {
        float temp1 = 0;
        NSString *semaforo = [[NSString alloc] init];
        
        //NSLog(@"titulo %@",[[razones objectAtIndex:i] titulo]);
        
        NSNumber *temp2 = [[NSNumber alloc] init];
        //temp2 = [self calculateNumerador:[[razones objectAtIndex:i] numeradorFormula] :cuentas];
        temp2 = [self calculateValue:[[razones objectAtIndex:i] numeradorFormula] :cuentas];
        [[razones objectAtIndex:i] setNumerador:temp2];
        //NSLog(@"numerador %d",[temp2 intValue]);
        
        temp1 = [temp2 intValue];
        
        //temp2 = [self calculateDenominador:[[razones objectAtIndex:i] denominadorFormula] :cuentas];
        temp2 = [self calculateValue:[[razones objectAtIndex:i] denominadorFormula] :cuentas];
        [[razones objectAtIndex:i] setDenominador:temp2];
        //NSLog(@"denominador %d",[temp2 intValue]);
        
        if ([temp2 intValue] != 0) {
            temp1 = (temp1 / [temp2 intValue]);
            
            //NSLog(@"total %f",temp1);
            
            temp2 = [[NSNumber alloc] initWithFloat:temp1];
            [[razones objectAtIndex:i] setValor:[NSString stringWithFormat:@"%.02f",temp1]];
            
            //Rojo: Menor a 1
            //Ambar: Caso 1 (Mayor a 1 y Menor a 2), Caso 2 (Mayor a 2)
            //Verde: Igual 2
            if (temp1 < 1) {
                semaforo = @"semaforo_r.png";
            }else if (temp1 > 1 &&  temp1 < 2) {
                semaforo = @"semaforo_a.png";
            }else if (temp1 == 2){
                semaforo = @"semaforo_v.png";
            }
            //NSLog(@"semaforo %@",semaforo);
            [[razones objectAtIndex:i] setSemaforo:semaforo];
        } else {
            [[razones objectAtIndex:i] setValor:@"No aplica"];
            [[razones objectAtIndex:i] setSemaforo:@"semaforo_r.png"];
        }
    }
    return razones;
}

- (NSNumber *)calculateValue: (NSString *)formula: (NSMutableArray *)cuentas {
    int index  = 0;
    int result = 0;
    int j = 0;
    NSNumber *temp;
    NSArray  *indexes = [formula componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"+-"]];
    
    NSArray  *signs   = [formula componentsSeparatedByCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    
    //NSLog(@"%@", indexes);
    //NSLog(@"%@", signs);
    
    index  = [[indexes objectAtIndex:j] intValue];
    result = [[cuentas objectAtIndex:index] intValue];
    for (int i=0; i < [signs count]; i++) {
        if ([[signs objectAtIndex:i] isEqualToString:@"+"]) {
            j++;
            index  = [[indexes objectAtIndex:j] intValue];
            result = result + [[cuentas objectAtIndex:index] intValue];
        } else if ([[signs objectAtIndex:i] isEqualToString:@"-"]) {
            j++;
            index  = [[indexes objectAtIndex:(j)] intValue];
            result = result - [[cuentas objectAtIndex:index] intValue];
        }
    }
    
    //NSLog(@"result: %d", result);
    temp = [[NSNumber alloc] initWithInt:result];
    
    return temp;
}

@end