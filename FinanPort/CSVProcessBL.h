//
//  CSVProcessBL.h
//  FinanPort
//
//  Created by Ariel Parra on 10/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EstudioDAO.h"
#import "CuentaPeriodoDAO.h"
#import "CatalogoCuentaDAO.h"
#import "CuentaPeriodo.h"
#import "Estudio.h"

@interface CSVProcessBL : NSObject

@property (nonatomic, retain) CatalogoCuentaDAO * catalogoCuentaDAO;
@property (nonatomic, retain) CuentaPeriodoDAO  * cuentaPeriodoDAO;
@property (nonatomic, retain) EstudioDAO        * estudioDAO;

-(void) processCSVFile:(NSArray *) cuentas;

@end
