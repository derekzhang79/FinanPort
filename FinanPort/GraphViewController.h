//
//  GraphViewController.h
//  FinanPort
//
//  Created by Ariel Parra on 16/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraphViewController : UIViewController <CPTPlotDataSource>

@property (nonatomic, strong) IBOutlet UIImageView         * grafica;
@property (nonatomic, strong)          CPTGraphHostingView * hostView;
@property (nonatomic, strong)          CPTTheme            * selectedTheme;

-(void)initPlot;
-(void)configureHost;
-(void)configureGraph;
-(void)configureChart;
-(void)configureLegend;

@end
