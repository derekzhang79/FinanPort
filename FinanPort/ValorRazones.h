//
//  ValorRazones.h
//  FinanPort
//
//  Created by Ariel Parra on 13/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CatalogoGeografico, CatalogoRazones, CatalogoSectores;

@interface ValorRazones : NSManagedObject

@property (nonatomic, retain) NSNumber * maximo;
@property (nonatomic, retain) NSNumber * medio;
@property (nonatomic, retain) NSNumber * minimo;
@property (nonatomic, retain) CatalogoGeografico *pais;
@property (nonatomic, retain) CatalogoRazones *razon;
@property (nonatomic, retain) CatalogoSectores *sector;

@end
