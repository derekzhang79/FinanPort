//
//  MainCollectionViewController.h
//  FinanPort
//
//  Created by Vega on 12/7/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <MessageUI/MessageUI.h>
#import "Razon.h"
#import "RazonCell.h"
#import "DetailViewController.h"
#import "MonthChooserViewController.h"
#import "Bussines.h"
#import "NSString+ParsingExtensions.h"
#import "CSVProcessBL.h"
#import "ExportManagerBL.h"

@interface MainCollectionViewController : UICollectionViewController <MonthChooserDelegate,
                                                                      MFMailComposeViewControllerDelegate,
                                                                      NSFetchedResultsControllerDelegate>

@property (retain, strong)    IBOutlet  UIPopoverController        * popoverController;
@property (retain, nonatomic) IBOutlet  UIAlertView                * alert;
@property (weak, nonatomic)   IBOutlet  UIBarButtonItem            * monthButton;
@property (strong, nonatomic)           NSFetchedResultsController * fetchedResultsController;
@property (strong, nonatomic)           NSManagedObjectContext     * managedObjectContext;
@property (retain, nonatomic)           NSArray                    * importedRows;
@property (retain, nonatomic)           NSURL                      * urlCSV;
@property (retain, nonatomic)           CSVProcessBL               * processCSV;
@property (retain, nonatomic)           ExportManagerBL            * exportManager;
@property (retain, nonatomic)           MonthChooserViewController * monthChooseViewController;
@property (strong, nonatomic)           Bussines                   * bussines;

- (void)     handleOpenURL:(NSURL *)url;
- (IBAction) displayPopOver:(id)sender;
- (IBAction) openMail:(id)sender;

@end
