//
//  Razon.h
//  FinanPort
//
//  Created by Vega on 12/7/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Razon : NSObject

@property(nonatomic, strong) NSString *titulo;
@property(nonatomic, strong) NSString *semaforo;
@property(nonatomic, strong) NSString *valor;
@property(nonatomic, strong) NSString *significado;
@property(nonatomic, strong) NSString *lectura;
@property(nonatomic, strong) NSString *cuadroDeAccion;
@property(nonatomic, strong) NSString *numeradorFormula;
@property(nonatomic, strong) NSString *tituloDelNumerador;
@property(nonatomic, strong) NSString *denominadorFormula;
@property(nonatomic, strong) NSString *tituloDelDenomidor;
@property(nonatomic, strong) NSNumber *numerador;
@property(nonatomic, strong) NSNumber *denominador;
@property(nonatomic, strong) NSString *formula;
@property(nonatomic, strong) NSString *condicionesSemaforoVerde;
@property(nonatomic, strong) NSString *condicionesSemaforoAmarillo;
@property(nonatomic, strong) NSString *condicionesSemaforoRojo;


@end