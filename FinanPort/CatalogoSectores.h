//
//  CatalogoSectores.h
//  FinanPort
//
//  Created by Ariel Parra on 13/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CatalogoSectores : NSManagedObject

@property (nonatomic, retain) NSNumber * index;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSManagedObject *valorRazones;

@end
