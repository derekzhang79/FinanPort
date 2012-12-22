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

@synthesize graphManager;
@synthesize razonActual;
@synthesize detalleDelSignificado;
@synthesize detalleDeLaLectura;
@synthesize detalleDelCuadrodeAccion;
@synthesize semaforo;
@synthesize detalleDeLosValoresDeLaGrafica;
@synthesize detalleDelValorDeLaRazon;
@synthesize scrollView;
@synthesize pageControl;
@synthesize numberOfPages;

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
    
    [self setTitle:[razonActual titulo]];
    [detalleDelSignificado setText:[razonActual significado]];
    [detalleDeLaLectura setText:[NSString stringWithFormat:[razonActual lectura],[razonActual valor]]];
    [detalleDelCuadrodeAccion setText:[razonActual cuadroDeAccion]];
    UIImage *imagen = [UIImage imageNamed:[razonActual semaforo]];
    [semaforo setImage:imagen];
    [detalleDelValorDeLaRazon setText:[razonActual valor]];
    
    numberOfPages = 2;
    [pageControl setNumberOfPages:numberOfPages];
    NSLog(@"Number of images for gallery: %d", numberOfPages);
	
    // define the scroll view content size and enable paging
    [scrollView setPagingEnabled: YES] ;
    [scrollView setContentSize: CGSizeMake(422.0 * numberOfPages, 323.0-15)];
	
    // programmatically add the page control
    pageControl = [[DDPageControl alloc] init];
    [pageControl setCenter: CGPointMake(770.0, 405.0)];
    [pageControl setNumberOfPages: numberOfPages];
    [pageControl setCurrentPage: 0];
    [pageControl setDefersCurrentPageDisplay: YES];
    [pageControl setType: DDPageControlTypeOnFullOffEmpty];
    [pageControl setOnColor: [UIColor colorWithWhite: 0.9f alpha: 1.0f]];
    [pageControl setOffColor: [UIColor colorWithWhite: 0.7f alpha: 1.0f]];
    [pageControl setIndicatorDiameter: 6.0f];
    [pageControl setIndicatorSpace: 8.0f];
        
    [self.view addSubview: pageControl];
    
    graphManager = [[GraphManagerBL alloc] init];
    [graphManager initPlot];
    
    for (int i=0 ; i<numberOfPages; i++)
    {
        // determine the frame of the current page
        CGRect pageFrame = CGRectMake(i * 422.0, 0.0f, 422.0, 323.0 - 16) ;
        
        UIImageView *imageGallery = [[UIImageView alloc] initWithFrame:pageFrame];
        
        imageGallery.image = [graphManager getGraphImage];
		
        // add it to the scroll view
        [scrollView addSubview: imageGallery] ;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
	CGFloat pageWidth = scrollView.bounds.size.width;
    
    float fractionalPage = scrollView.contentOffset.x / pageWidth ;
	NSInteger nearestNumber = lround(fractionalPage) ;
	
	if (pageControl.currentPage != nearestNumber)
	{
		pageControl.currentPage = nearestNumber ;
		
		// if we are dragging, we want to update the page control directly during the drag
		if (scrollView.dragging)
			[pageControl updateCurrentPageDisplay];
	}
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)aScrollView
{
	// if we are animating (triggered by clicking on the page control), we update the page control
	[pageControl updateCurrentPageDisplay] ;
}


@end
