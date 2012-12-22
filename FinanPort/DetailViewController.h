//
//  DetailViewController.h
//  FinanPort
//
//  Created by Vega on 12/7/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDPageControl.h"
#import "Razon.h"
#import "CorePlot-CocoaTouch.h"
#import "CPDConstants.h"
#import "CPDStockPriceStore.h"

@interface DetailViewController : UIViewController <UIScrollViewDelegate,
                                                    CPTPlotDataSource>

@property (retain, nonatomic) IBOutlet UIScrollView  * scrollView;
@property (weak,   nonatomic) IBOutlet UITextView    * detalleDelSignificado;
@property (weak,   nonatomic) IBOutlet UITextView    * detalleDeLaLectura;
@property (weak,   nonatomic) IBOutlet UIImageView   * semaforo;
@property (weak,   nonatomic) IBOutlet UILabel       * detalleDelCuadrodeAccion;
@property (weak,   nonatomic) IBOutlet UILabel       * detalleDeLosValoresDeLaGrafica;
@property (weak,   nonatomic) IBOutlet UITextView    * detalleDelValorDeLaRazon;
@property (retain, nonatomic)          DDPageControl * pageControl;
@property (strong, nonatomic)          Razon         * razonActual;
@property (nonatomic)                  int             numberOfPages;
@property (nonatomic, strong)          CPTGraphHostingView * hostView;
@property (nonatomic, strong)          CPTTheme            * selectedTheme;
@property (nonatomic, strong) IBOutlet UIImageView         * grafica;

-(void)initPlot;
-(void)configureHost;
-(void)configureGraph;
-(void)configureChart;
-(void)configureLegend;

@end
