//
//  AppDelegate.h
//  FinanPort
//
//  Created by Vega on 12/6/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "MainCollectionViewController.h"
#import "PrePopulate.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic)           MainCollectionViewController  * mainCollectionViewController;
@property (strong, nonatomic)           UIWindow                      * window;
@property (readonly, strong, nonatomic) NSManagedObjectContext        * managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel          * managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator  * persistentStoreCoordinator;

- (void)saveContext;
@end
