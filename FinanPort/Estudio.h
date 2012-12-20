//
//  Estudio.h
//  FinanPort
//
//  Created by Ariel Parra on 12/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Estudio : NSManagedObject

@property (nonatomic, retain) NSDate   * fecha;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSSet    * cuentas;

@end

@interface Estudio (CoreDataGeneratedAccessors)

- (void)addCuentasObject:(NSManagedObject *)value;
- (void)removeCuentasObject:(NSManagedObject *)value;
- (void)addCuentas:(NSSet *)values;
- (void)removeCuentas:(NSSet *)values;

@end
