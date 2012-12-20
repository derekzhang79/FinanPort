//
//  DetailViewController.h
//  FinanPort
//
//  Created by Vega on 12/7/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Razon.h"

@interface DetailViewController : UIViewController
//  Property section
//  Add below this section any properties
@property(nonatomic, strong) Razon *razonActual;
@property (weak, nonatomic) IBOutlet UITextView *detalleDelSignificado;
@property (weak, nonatomic) IBOutlet UITextView *detalleDeLaLectura;
@property (weak, nonatomic) IBOutlet UIImageView *semaforo;
@property (weak, nonatomic) IBOutlet UILabel *detalleDelCuadrodeAccion;
@property (weak, nonatomic) IBOutlet UILabel *detalleDeLosValoresDeLaGrafica;
@property (weak, nonatomic) IBOutlet UITextView *detalleDelValorDeLaRazon;
@property (weak, nonatomic) IBOutlet UIImageView *graph;

//  Action section
//  add below this section any actions

@end
