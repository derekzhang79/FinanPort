//
//  DetailViewController.m
//  FinanPort
//
//  Created by Vega on 12/7/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize razonActual;
@synthesize detalleDelSignificado;
@synthesize detalleDeLaLectura;
@synthesize detalleDelCuadrodeAccion;
@synthesize semaforo;
@synthesize detalleDeLosValoresDeLaGrafica;
@synthesize detalleDelValorDeLaRazon;
@synthesize graph;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //NSLog(@"tituloDeLaRazon: %@",[razonActual tituloDeLaRazon]);
    //NSLog(@"semaforo: %@",[razonActual semaforo]);
    //NSLog(@"valorDeLaRazon: %@",[razonActual valorDeLaRazon]);
    [self setTitle:[razonActual tituloDeLaRazon]];
    [detalleDelSignificado setText:[razonActual detalleDelSignificado]];
    [detalleDeLaLectura setText:[razonActual detalleDeLaLectura]];
    [detalleDelCuadrodeAccion setText:[razonActual detalleDelCuadroDeAccion]];
    UIImage *imagen = [UIImage imageNamed:[razonActual semaforo]];
    [semaforo setImage:imagen];
    [detalleDeLosValoresDeLaGrafica setText:[razonActual detalleDeLosValoresDeLaGrafica]];
    [detalleDelValorDeLaRazon setText:[razonActual detalleDelValorDeLaRazon]];
    imagen = [UIImage imageNamed:@"pie-graph.png"];
    [graph setImage:imagen];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
