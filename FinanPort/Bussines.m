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
        float     valor        = 0;
        float     numerador    = 0;
        float     denominador  = 0;
        NSString *semaforo     = [[NSString alloc] init];
        
        //NSLog(@"Business.getRazonesByMonth-titulo %@",[[razones objectAtIndex:i] titulo]);
        
        numerador = [self calculateValue:[[razones objectAtIndex:i] numeradorFormula] :cuentas];
        [[razones objectAtIndex:i] setNumerador:[[NSNumber alloc] initWithFloat:numerador]];
        //NSLog(@"Business.getRazonesByMonth-numerador: %f",numerador);
        
        denominador = [self calculateValue:[[razones objectAtIndex:i] denominadorFormula] :cuentas];
        [[razones objectAtIndex:i] setDenominador:[[NSNumber alloc] initWithFloat:denominador]];
        //NSLog(@"Business.getRazonesByMonth-numerador: %f",denominador);
        
        if (denominador != 0) {
            valor = numerador/denominador;
            
            //NSLog(@"Business.getRazonesByMonth-valor: %f",valor);

            [[razones objectAtIndex:i] setValor:[NSString stringWithFormat:@"%.02f",valor]];
                       
            semaforo = [self defineSemaforo :[[razones objectAtIndex:i] condicionesSemaforoVerde] :[[razones objectAtIndex:i] condicionesSemaforoAmarillo] :[[razones objectAtIndex:i] condicionesSemaforoRojo] :valor];
            [[razones objectAtIndex:i] setSemaforo:semaforo];
            //NSLog(@"Business.getRazonesByMonth-semaforo %@",semaforo);
        } else {
            [[razones objectAtIndex:i] setValor:@"No aplica"];
            [[razones objectAtIndex:i] setSemaforo:@"semaforo_r.png"];
        }
    }
    return razones;
}

- (float)calculateValue: (NSString *)formula: (NSMutableArray *)cuentas {
    int       index      = 0;
    float     resultado  = 0;
    NSArray  *indexes    = [self getIndexes:formula];
    NSArray  *signs      = [self getSigns:formula];
    
    for (int i=0; i < [indexes count]; i++) {
        index  = [[indexes objectAtIndex:i] intValue];
        if (i == 0) {
            resultado = [[cuentas objectAtIndex:index] floatValue];
        } else {
            if ([[signs objectAtIndex:(i-1)] isEqualToString:@"+"]) {
                resultado = resultado + [[cuentas objectAtIndex:index] floatValue];
            } else if ([[signs objectAtIndex:(i-1)] isEqualToString:@"-"]) {
                resultado = resultado - [[cuentas objectAtIndex:index] floatValue];
            }
        }
    }
    //NSLog(@"Business.calculateValue-result: %f", resultado);
    return resultado;
}

- (NSArray *)getIndexes :(NSString *)formula {
    NSArray        *temp;
    NSMutableArray *resultado = [[NSMutableArray alloc] init];
    
    temp = [formula componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"+- "]];
    //NSLog(@"Business.getIndexes-raw: %@", temp);
    for (int i = 0; i < [temp count]; i++) {
        if ([[temp objectAtIndex:i] length] > 0) {
            [resultado addObject:[temp objectAtIndex:i]];
        }
    }
    //NSLog(@"Business.getIndexes-resultado: %@", resultado);
    return [[NSArray alloc] initWithArray:resultado];
}

- (NSArray *)getSigns :(NSString *)formula {
    NSArray        *temp;
    NSMutableArray *resultado = [[NSMutableArray alloc] init];
    
    temp = [formula componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"0123456789 "]];
    //NSLog(@"Business.getIndexes-raw: %@", temp);
    for (int i = 0; i < [temp count]; i++) {
        if ([[temp objectAtIndex:i] length] != 0) {
            [resultado addObject:[temp objectAtIndex:i]];
        }
    }
    //NSLog(@"Business.getIndexes-resultado: %@", resultado);
    return [[NSArray alloc] initWithArray:resultado];
}

- (NSString *)defineSemaforo :(NSString *)condicionesSemaforoVerde :(NSString *)condicionesSemaforoAmarillo :(NSString *)condicionesSemaforoRojo :(float)valor {
    
    if ([condicionesSemaforoVerde length] > 0) {
        if ([self validateConditions :condicionesSemaforoVerde :valor]) {
            //NSLog(@"Business.defineSemaforo-semaforo_v.png");
            return @"semaforo_v.png";
        }
    }
    
    if ([condicionesSemaforoAmarillo length] > 0) {
        if ([self validateConditions :condicionesSemaforoAmarillo :valor]) {
            //NSLog(@"Business.defineSemaforo-semaforo_a.png");
            return @"semaforo_a.png";
        }
    }

    if ([condicionesSemaforoAmarillo length] > 0) {
        if ([self validateConditions :condicionesSemaforoRojo :valor]) {
            //NSLog(@"Business.defineSemaforo-semaforo_r.png");
            return @"semaforo_r.png";
        }
    }
    
    return @"semaforo_r.png";
}

- (Boolean)validateConditions :(NSString *)condicion :(float)valor{
    Boolean   resultado   = 0;
    NSArray  *condiciones = [self getConditions:condicion];
    NSArray  *signs       = [self getLogicSigns:condicion];
    
    for (int i=0; i < [condiciones count]; i++) {
        if (i == 0) {
            resultado = [self validateCondition:[condiciones objectAtIndex:i] :valor];
        } else {
            if ([[signs objectAtIndex:(i-1)] isEqualToString:@"&"]) {
                resultado = resultado && [self validateCondition:[condiciones objectAtIndex:i] :valor];
            } else if ([[signs objectAtIndex:(i-1)] isEqualToString:@"|"]) {
                resultado = resultado || [self validateCondition:[condiciones objectAtIndex:i] :valor];
            }
        }
    }
    return resultado;;
}

- (NSArray *)getConditions :(NSString *)condicion {
    NSArray        *temp;
    NSMutableArray *resultado = [[NSMutableArray alloc] init];
    
    temp = [condicion componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"&| "]];
    //NSLog(@"Business.getConditions-raw: %@", temp);
    for (int i = 0; i < [temp count]; i++) {
        if ([[temp objectAtIndex:i] length] != 0) {
            [resultado addObject:[temp objectAtIndex:i]];
        }
    }
    //NSLog(@"Business.getConditions-resultado: %@", resultado);
    return [[NSArray alloc] initWithArray:resultado];
}

- (NSArray *)getLogicSigns :(NSString *)condicion {
    NSArray        *temp;
    NSMutableArray *resultado = [[NSMutableArray alloc] init];
    
    temp = [condicion componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>=.1234567890 "]];
    //NSLog(@"Business.getLogicSigns-raw: %@", temp);
    for (int i = 0; i < [temp count]; i++) {
        if ([[temp objectAtIndex:i] length] != 0) {
            [resultado addObject:[temp objectAtIndex:i]];
        }
    }
    //NSLog(@"Business.getLogicSigns-resultado: %@", resultado);
    return [[NSArray alloc] initWithArray:resultado];
}

- (Boolean)validateCondition :(NSString *)condicion :(float)valor1{
    float     valor2    = 0;
    NSString *temp      = [condicion stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>= "]];
    
    valor2 = [temp floatValue];
    NSLog(@"Business.validateCondition-valor1: %f valor2: %f", valor1, valor2);
    if ([condicion hasPrefix:@"<="]) {
        if (valor1 <= valor2) {
            //NSLog(@"Business.validateCondition-TRUE");
            return TRUE;
        }
    }
    if ([condicion hasPrefix:@">="]) {
        if (valor1 >= valor2) {
            //NSLog(@"Business.validateCondition-TRUE");
            return TRUE;
        }
    }
    if ([condicion hasPrefix:@"="]) {
        if (valor1 == valor2) {
            //NSLog(@"Business.validateCondition-TRUE");
            return TRUE;
        }
    }
    if ([condicion hasPrefix:@"<"]) {
        if (valor1 < valor2) {
            //NSLog(@"Business.validateCondition-TRUE");
            return TRUE;
        }
    }
    if ([condicion hasPrefix:@">"]) {
        if (valor1 > valor2) {
            //NSLog(@"Business.validateCondition-TRUE");
            return TRUE;
        }
    }
    //NSLog(@"Business.validateCondition-FALSE");
    return FALSE;
}

@end