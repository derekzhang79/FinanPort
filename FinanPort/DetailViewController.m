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
@synthesize scrollView;
@synthesize pageControl;
@synthesize numberOfPages;
@synthesize hostView = hostView_;
@synthesize selectedTheme = selectedTheme_;

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
    
    [self initPlot];
    
    NSLog(@"Adding pageControl");
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

#pragma mark - CPTPlotDataSource methods
-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
    return [[[CPDStockPriceStore sharedInstance] tickerSymbols] count];
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
    if (CPTPieChartFieldSliceWidth == fieldEnum)
    {
        return [[[CPDStockPriceStore sharedInstance] dailyPortfolioPrices] objectAtIndex:index];
    }
    return [NSDecimalNumber zero];
}

-(CPTLayer *)dataLabelForPlot:(CPTPlot *)plot recordIndex:(NSUInteger)index
{
    // 1 - Define label text style
    static CPTMutableTextStyle *labelText = nil;
    if (!labelText) {
        labelText= [[CPTMutableTextStyle alloc] init];
        labelText.color = [CPTColor grayColor];
    }
    // 2 - Calculate portfolio total value
    NSDecimalNumber *portfolioSum = [NSDecimalNumber zero];
    for (NSDecimalNumber *price in [[CPDStockPriceStore sharedInstance] dailyPortfolioPrices]) {
        portfolioSum = [portfolioSum decimalNumberByAdding:price];
    }
    // 3 - Calculate percentage value
    NSDecimalNumber *price = [[[CPDStockPriceStore sharedInstance] dailyPortfolioPrices] objectAtIndex:index];
    NSDecimalNumber *percent = [price decimalNumberByDividingBy:portfolioSum];
    // 4 - Set up display label
    NSString *labelValue = [NSString stringWithFormat:@"$%0.2f USD (%0.1f %%)", [price floatValue], ([percent floatValue] * 100.0f)];
    // 5 - Create and return layer with label text
    return [[CPTTextLayer alloc] initWithText:labelValue style:labelText];
}

-(NSString *)legendTitleForPieChart:(CPTPieChart *)pieChart recordIndex:(NSUInteger)index
{
    if (index < [[[CPDStockPriceStore sharedInstance] tickerSymbols] count]) {
        return [[[CPDStockPriceStore sharedInstance] tickerSymbols] objectAtIndex:index];
    }
    return @"N/A";
}

#pragma mark - Chart behavior
-(void)initPlot
{
    [self configureHost];
    [self configureGraph];
    [self configureChart];
    [self configureLegend];
}

-(void)configureHost
{
    // 1 - Set up view frame
    CGRect parentRect = self.view.bounds;
    parentRect = CGRectMake(parentRect.origin.x + 10,
                            (parentRect.origin.y + 10),
                            parentRect.size.width - 20,
                            parentRect.size.height - 20);
    // 2 - Create host view
    self.hostView = [(CPTGraphHostingView *) [CPTGraphHostingView alloc] initWithFrame:parentRect];
    self.hostView.allowPinchScaling = NO;
    //[self.view addSubview:self.hostView];
}

-(void)configureGraph
{
    // 1 - Create and initialize graph
    CPTGraph *graph = [[CPTXYGraph alloc] initWithFrame:self.hostView.bounds];
    self.hostView.hostedGraph = graph;
    graph.paddingLeft = 0.0f;
    graph.paddingTop = 0.0f;
    graph.paddingRight = 0.0f;
    graph.paddingBottom = 0.0f;
    graph.axisSet = nil;
    // 2 - Set up text style
    CPTMutableTextStyle *textStyle = [CPTMutableTextStyle textStyle];
    textStyle.color = [CPTColor grayColor];
    textStyle.fontName = @"Helvetica-Bold";
    textStyle.fontSize = 16.0f;
    // 3 - Configure title
    NSString *title = @"Razón de Capital de Trabajo";
    graph.title = title;
    graph.titleTextStyle = textStyle;
    graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
    graph.titleDisplacement = CGPointMake(0.0f, -12.0f);
    // 4 - Set theme
    self.selectedTheme = [CPTTheme themeNamed:kCPTPlainWhiteTheme];
    [graph applyTheme:self.selectedTheme];
}

-(void)configureChart
{
    // 1 - Get reference to graph
    CPTGraph *graph = self.hostView.hostedGraph;
    // 2 - Create chart
    CPTPieChart *pieChart = [[CPTPieChart alloc] init];
    pieChart.dataSource = self;
    pieChart.delegate = self;
    pieChart.pieRadius = (self.hostView.bounds.size.height * 0.7) / 2;
    pieChart.identifier = graph.title;
    pieChart.startAngle = M_PI_4;
    pieChart.sliceDirection = CPTPieDirectionClockwise;
    // 3 - Create gradient
    CPTGradient *overlayGradient = [[CPTGradient alloc] init];
    overlayGradient.gradientType = CPTGradientTypeRadial;
    overlayGradient = [overlayGradient addColorStop:[[CPTColor blackColor] colorWithAlphaComponent:0.0] atPosition:0.9];
    overlayGradient = [overlayGradient addColorStop:[[CPTColor blackColor] colorWithAlphaComponent:0.4] atPosition:1.0];
    pieChart.overlayFill = [CPTFill fillWithGradient:overlayGradient];
    // 4 - Add chart to graph
    [graph addPlot:pieChart];
}

-(void)configureLegend
{
    // 1 - Get graph instance
    CPTGraph *graph = self.hostView.hostedGraph;
    // 2 - Create legend
    CPTLegend *theLegend = [CPTLegend legendWithGraph:graph];
    // 3 - Configure legend
    theLegend.numberOfColumns = 1;
    theLegend.fill = [CPTFill fillWithColor:[CPTColor whiteColor]];
    theLegend.borderLineStyle = [CPTLineStyle lineStyle];
    theLegend.cornerRadius = 5.0;
    // 4 - Add legend to graph
    graph.legend = theLegend;
    graph.legendAnchor = CPTRectAnchorRight;
    CGFloat legendPadding = -(self.view.bounds.size.width / 8);
    graph.legendDisplacement = CGPointMake(legendPadding, 0.0);
    
    CGRect pageFrame;
    
    for (int i=0 ; i<numberOfPages; i++)
    {
        // determine the frame of the current page
        pageFrame = CGRectMake(i * 422.0, 0.0f, 422.0, 323.0-16);
		
        UIImage * mainImageLoad;
        
        mainImageLoad = [graph imageOfLayer];
        
        UIImageView *imageGallery = [[UIImageView alloc] initWithFrame:pageFrame];
        
        imageGallery.image = mainImageLoad;
		
        // add it to the scroll view
        [scrollView addSubview: imageGallery];
    }
}

@end
