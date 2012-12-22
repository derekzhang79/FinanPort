//
//  MainCollectionViewController.m
//  FinanPort
//
//  Created by Vega on 12/7/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import "MainCollectionViewController.h"

@interface MainCollectionViewController ()

@end

@implementation MainCollectionViewController

@synthesize alert;
@synthesize monthChooseViewController;
@synthesize monthButton;
@synthesize popoverController;
@synthesize bussines;
@synthesize importedRows;
@synthesize processCSV;
@synthesize urlCSV;
@synthesize exportManager;

    //  Add below this section the variables
    NSMutableArray *razones;

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

    [[self collectionView] setDataSource:self];
    [[self collectionView] setDelegate:self];
    
    bussines = [[Bussines alloc] init];
    //NSLog(@"Bussines logs; %@", [[bussines months] objectAtIndex:0]);
    [monthButton setTitle:[[bussines months] objectAtIndex:0]];
    
    razones = [bussines getRazonesByMonth:0];
    //NSLog(@"razones: %@", [[razones objectAtIndex:0] titulo]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [razones count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"razonCell";
    RazonCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifier forIndexPath:indexPath];
    
    [[cell tituloDeLaRazon] setText:[[razones objectAtIndex:indexPath.item] titulo]];
    //NSLog(@"semaforo cell %@",[[razones objectAtIndex:indexPath.item] semaforo]);
    UIImage *imagen = [UIImage imageNamed:[[razones objectAtIndex:indexPath.item] semaforo]];
    [[cell semaforo] setImage:imagen];
    [[cell valorDeLaRazon] setText:[[razones objectAtIndex:indexPath.item] valor]];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //NSLog(@"prepareForSegue");
    NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] lastObject];
    Razon *razon = [razones objectAtIndex:[indexPath row]];
    //NSLog(@"1tituloDeLaRazon: %@",[razon tituloDeLaRazon]);
    //NSLog(@"1semaforo: %@",[razon semaforo]);
    //NSLog(@"1valorDeLaRazon: %@",[razon valorDeLaRazon]);
    
    if ([[segue identifier] isEqualToString:@"showDetails"] && !([[razon valor] isEqualToString:@"No aplica"])) {
        //UINavigationController *navigationController = segue.destinationViewController;
        DetailViewController *detailViewController = [segue destinationViewController];
        
        [detailViewController setRazonActual:razon];
    }
}

- (IBAction)displayPopOver:(id)sender {
    
    if ([popoverController isPopoverVisible]) {
        [popoverController dismissPopoverAnimated:YES];
    } else {
        monthChooseViewController = [[MonthChooserViewController alloc] init];
        [monthChooseViewController setMonths:[bussines months]];
        
        popoverController = [[UIPopoverController alloc] initWithContentViewController:monthChooseViewController];
        
        monthChooseViewController.delegate = self;
        
        [[popoverController self] presentPopoverFromBarButtonItem:sender
                                         permittedArrowDirections:UIPopoverArrowDirectionAny
                                                         animated:YES];
    }
}

- (void)didSelectMonth{
    //NSLog(@"didSelectMonth.");
    
    //NSLog(@"Bussines didSelectMonth logs; %@", [[bussines months] objectAtIndex:[[monthChooseViewController monthIndexPath] row]]);
    [monthButton setTitle:[[bussines months] objectAtIndex:[[monthChooseViewController monthIndexPath] row]]];
    
    NSNumber *temp = [[NSNumber alloc] initWithInt:[[monthChooseViewController monthIndexPath] row]];
    razones = [bussines getRazonesByMonth:temp];
    
    [self.collectionView reloadData];
    
    [popoverController dismissPopoverAnimated:YES];
}


/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Bussines *bussines = [[Bussines alloc] init];
    NSMutableArray *months = [bussines getMonths];
    [monthButton setTitle:[months objectAtIndex:[indexPath row]]];
}
*/

-(void) handleOpenURL:(NSURL *)url {
    
    alert = [[UIAlertView alloc] initWithTitle:@"FinanPort"
                                       message:@"Usted esta cargando un nuevo paquete de información para ser analizada por FinanPort, esto remplazará el paquete actual. Si desea continuar de clic en Aceptar, sino, de clic en Cancelar para regresar al actual."
                                      delegate:self
                             cancelButtonTitle:@"Cancelar"
                             otherButtonTitles:@"Aceptar",nil];
    [alert show];
    
    urlCSV = url;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    //NSLog(@"alertView: %d", buttonIndex);
    if(buttonIndex == 0){
        //NSLog(@"Cancelar");
        razones = [bussines getRazonesByMonth:0];
        //NSLog(@"razones: %@", [[razones objectAtIndex:0] tituloDeLaRazon]);
    }else if(buttonIndex == 1){
        //NSLog(@"Aceptar");
        NSNumber *temp = [[NSNumber alloc] initWithInt:1];
        razones = [bussines getRazonesByMonth:temp];
        //NSLog(@"razones: %@", [[razones objectAtIndex:0] tituloDeLaRazon]);
        
        NSError *outError;
        NSString *fileString = [NSString stringWithContentsOfURL:urlCSV
                                                        encoding:NSUTF8StringEncoding error:&outError];
        
        if (fileString) {
            self.importedRows = [fileString csvRows];
        }
        
        NSLog(@"Total of rows: %d", [self.importedRows count]);
        /*
         for(NSArray *row in self.importedRows) {
         NSLog(@"%@\n", [row objectAtIndex:0]);
         }*/
        
        processCSV = [[CSVProcessBL alloc] init];
        [processCSV processCSVFile:self.importedRows];
    }
    
    [self.collectionView reloadData];
}

#pragma mark - mail app
- (IBAction)openMail:(id)sender
{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        
        if (mailer !=nil) {
            [mailer setSubject:@"FinanPort - Información de la razón"];
            
            exportManager = [[ExportManagerBL alloc] init];
            
            NSData *myData = UIImagePNGRepresentation([exportManager takeScreenshoot:self.view]);
            
            [mailer addAttachmentData:myData mimeType:@"image/png" fileName:@"finanportrazon.png"];
            
            [self presentViewController:mailer animated:YES completion:nil];
        }
        else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Da de alta una cuenta de correo en tu iPad"
                                                                message:@"Intenta de nuevo"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
            [alertView show];
        }
        
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    
    // Remove the mail view
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
