//
//  PrePopulate.h
//  FinanPort
//
//  Created by Ariel Parra on 13/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CatalogoCuentas.h"
#import "CatalogoRazones.h"
#import "CatalogoSectores.h"
#import "CatalogoGeografico.h"
#import "CatalogoCuentaDAO.h"
#import "CatalogoRazonesDAO.h"
#import "CatalogoSectoresDAO.h"
#import "CatalogoGeograficoDAO.h"

@interface PrePopulate : NSObject

@property (nonatomic, retain) NSString              * contentCatalogoCuenta;
@property (nonatomic, retain) NSString              * contentCatalogoRazones;
@property (nonatomic, retain) NSString              * contentCatalogoSectores;
@property (nonatomic, retain) NSString              * contentCatalogoGeografico;
@property (nonatomic, retain) CatalogoCuentaDAO     * catalogoCuentaDAO;
@property (nonatomic, retain) CatalogoRazonesDAO    * catalogoRazonesDAO;
@property (nonatomic, retain) CatalogoSectoresDAO   * catalogoSectoresDAO;
@property (nonatomic, retain) CatalogoGeograficoDAO * catalogoGeograficoDAO;

-(void) setInformation;

@end
