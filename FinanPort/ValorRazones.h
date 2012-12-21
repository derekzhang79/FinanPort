//
//  ValorRazones.h
//  FinanPort
//
//  Created by Ariel Parra on 20/12/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ValorRazones : NSManagedObject

@property (nonatomic, retain) NSString * maximo;
@property (nonatomic, retain) NSString * medio;
@property (nonatomic, retain) NSString * minimo;
@property (nonatomic, retain) NSString * formula;
@property (nonatomic, retain) NSManagedObject *pais;
@property (nonatomic, retain) NSManagedObject *razon;
@property (nonatomic, retain) NSManagedObject *sector;

@end
