//
//  CuentaPeriodo.h
//  FinanPort
//
//  Created by Ariel Parra on 13/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CatalogoCuentas, Estudio;

@interface CuentaPeriodo : NSManagedObject

@property (nonatomic, retain) NSNumber * periodo;
@property (nonatomic, retain) NSNumber * valor;
@property (nonatomic, retain) CatalogoCuentas *catalogo;
@property (nonatomic, retain) Estudio *estudio;

@end
