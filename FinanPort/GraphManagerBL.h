//
//  GraphManagerBL.h
//  FinanPort
//
//  Created by Ariel Parra on 22/12/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CorePlot-CocoaTouch.h"
#import "CPDConstants.h"
#import "CPDStockPriceStore.h"

@interface GraphManagerBL : NSObject <CPTPlotDataSource>

@property (nonatomic, strong)          CPTGraphHostingView * hostView;
@property (nonatomic, strong)          CPTTheme            * selectedTheme;
@property (nonatomic, strong)          NSArray             * leyends;
-(void)initPlot;
-(void)configureHost;
-(void)configureGraph;
-(void)configureChart;
-(void)configureLegend;
-(UIImage *) getGraphImage;

@end
