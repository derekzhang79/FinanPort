//
//  AppDelegate.m
//  FinanPort
//
//  Created by Ariel Parra on 05/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize mainCollectionViewController;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // Example of CSV file:
    /* Uso:,"1) No modificar el titulo de las cuentas del documento, ni su orden",,,,,,"4) Las cuentas que diga E. Industrial/E. Comercial, son para las cuentas de Inv. Inicial",,,,,,
     ,2) No agregar cuentas o subcuentas al documento,,,,,,Inv. Final y Compras de tanto empresas industriales como comerciales,,,,,,
     ,3) Las cifras deben de ser numeros sin el signo de pesos,,,,,,5)No modicar el nombre del documento,,,,,,
     ,,,,,,,,,,,,,
     ,,,,,,,,,,,,,
     ,,,,,,,,,,,,,
     ,Enero,Febrero,Marzo,Abril,Mayo,Junio,Julio,Agosto,Septiembre,Octubre,Noviembre,Diciembre,Anual
     "Efectivo, caja y bancos",30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Inversion en instrumentos financieros,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Pagos anticipados,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Cuentas por cobrar,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Estimacion de Cuentas Incobrables,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Prestamos y anticipos al personal ,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Inventario de Materia Prima - E. Industrial/ E. Comercial,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Inventario de Produccion en Proceso,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Inventario de Producto Terminado,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Anticipo de impuestos,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Iva a favor,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Otros activos,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Inmueble,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Depreciacion acumulada de inmueble,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Maquinaria,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Depreciacion acumulada de maquinaria,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Equipo de transporte,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Depreciacion acumulada de transporte,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Terrenos ,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Depreciacion de Terrenos,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Mobiliario y Equipo de Oficina,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Depreciacion acumulada de mobiliario y equipo,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Intangibles,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Amortizacion acumulada de intangibles,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Cuentas por pagar corto plazo,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Proveedores corto plazo ,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Acreedores corto plazo,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Anticipos cobrados por anticipado,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Iva por pagar,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Impuestos por pagar,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Cuentas por pagar largo plazo,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Proveedores largo plazo,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Acreedores largo plazo,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Capital social pagado,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Capital social no pagado,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Aportaciones para futuros aumentos de capital,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Prima en venta de acciones,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Utilidad del ejercicio,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Utilidad retenida,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Perdidas acumuladas,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Ventas,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     "Devoluciones, rebajas y descuentos de Ventas",30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Inventario Inicial de Materia Prima - E. Industria/Comercial,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Compra Netas de Materia Prima - E. Industria/Comercial,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Inventario Final de Materia Prima - E. Industria/Comercial,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Mano de Obra - E. Industria,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Costos Indirectos de Fabricacion - E. Industria,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Inventario Inicial de Productos en Proceso - E. Industria,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Inventario Final de Productos en Proceso - E. Industria,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Inventario Inicial de Producto Terminado - E. Industria,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Inventario Final de Producto Terminado - E. Industria,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Gastos de ventas,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Gastos de administracion,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Otros gastos ,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Otros ingresos,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Utilidad Bruta,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     PTU,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Impuestos a la utilidad,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Utilidad Neta,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Plazo Teorico de Cobro,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Saldo Inicial de Clientes,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Saldo Final de Clientes,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Ventas a Credito,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     "Devolucion, rebajas y descuentos de Ventas a Credito",30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Compras netas de Materia Prima a Credito - E. Industrial/E.Comercial,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Saldo Inicial de Proveedores a Corto y Largo Plazo,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     Numero de dias del ejercicio,30000,60000,90000,120000,150000,180000,210000,240000,270000,300000,330000,360000,500000
     
     */
    
    // Override point for customization after application launch.
    UINavigationController *navigationController = (UINavigationController *) self.window.rootViewController;
    mainCollectionViewController = (MainCollectionViewController *)navigationController.topViewController;
    mainCollectionViewController.managedObjectContext = self.managedObjectContext;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *preloadDatabase = [defaults objectForKey:@"preloadDatabase"];
    
    if(preloadDatabase == nil) {
        PrePopulate *preload = [[PrePopulate alloc] init];
        [preload setInformation];
    }
    
    NSURL *url = (NSURL *)[launchOptions valueForKey:UIApplicationLaunchOptionsURLKey];
    if (url != nil && [url isFileURL]) {
        [mainCollectionViewController handleOpenURL:url];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self saveContext];
}

- (void)saveContext
{
    // Save CoreData context including all the entities on runtime
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

-(BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if (url != nil && [url isFileURL]) {
        [mainCollectionViewController handleOpenURL:url];
    }
    return YES;
}

#pragma mark - Core Data stack

// Regresa el context de los objetos administrados de la aplicación.
// Si el contexto no existe, este será creado y será enviado al coordinador de persistencia de la aplicación.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return _managedObjectContext;
}

// Regresa el modelo del objeto administrado de la aplicación.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"FinanPort" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Regresa el coordinador de la persistenacia de la aplicación.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"FinanPort.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Regresa la URL para el directorio de documentos de la aplicación.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
