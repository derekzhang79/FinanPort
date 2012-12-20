//
//  PrePopulate.m
//  FinanPort
//
//  Created by Ariel Parra on 13/12/12.
//  Copyright (c) 2012 Itnovare. All rights reserved.
//

#import "PrePopulate.h"

@implementation PrePopulate

@synthesize contentCatalogoCuenta;
@synthesize contentCatalogoRazones;
@synthesize contentCatalogoGeografico;
@synthesize contentCatalogoSectores;
@synthesize catalogoCuentaDAO;
@synthesize catalogoRazonesDAO;
@synthesize catalogoSectoresDAO;
@synthesize catalogoGeograficoDAO;

-(void) setInformation
{
    [self initCatalogoCuentas];
    
    [self initCatalogoRazones];
    
    [self initCatalogoGeografico];
    
    [self initCatalogoSectores];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"true" forKey:@"preloadDatabase"];
}

- (void) initCatalogoGeografico
{
    contentCatalogoGeografico = @"México";
    
    NSArray *catalogoGeografico = [contentCatalogoGeografico componentsSeparatedByString:@"|"];
    
    catalogoGeograficoDAO = [[CatalogoGeograficoDAO alloc] initContext];
    
    int index = 0;
    if([[catalogoGeograficoDAO getAllPaises] count] == 0) {
        for(NSString *catalogoPais in catalogoGeografico) {
            CatalogoGeografico *pais = [catalogoGeograficoDAO getNewCatalogoGeografico];
            pais.nombre = catalogoPais;
            pais.index = [NSNumber numberWithInt:index];
            
            NSError *error = nil;
            
            [catalogoGeograficoDAO.managedObjectContext save:&error];
            
            index++;
        }
    }
    NSLog(@"Número de catalogo de países: %d", [[catalogoGeograficoDAO getAllPaises] count]);
}

- (void) initCatalogoSectores
{
    contentCatalogoSectores = @"Manufactura|\
                                Comercial|\
                                Servicios";
    
    NSArray *catalogoSectores = [contentCatalogoSectores componentsSeparatedByString:@"|"];
    
    catalogoSectoresDAO = [[CatalogoSectoresDAO alloc] initContext];
    
    int index = 0;
    if([[catalogoSectoresDAO getAllSectores] count] == 0) {
        for(NSString *catalogoSector in catalogoSectores) {
            CatalogoSectores *sector = [catalogoSectoresDAO getNewCatalogoSector];
            sector.nombre = catalogoSector;
            sector.index = [NSNumber numberWithInt:index];
            
            NSError *error = nil;
            
            [catalogoSectoresDAO.managedObjectContext save:&error];
            
            index++;
        }
    }

    NSLog(@"Número de catalogo de sectores: %d", [[catalogoSectoresDAO getAllSectores] count]);
    
}

- (void) initCatalogoRazones
{
    contentCatalogoRazones = @"Razón del Capital del Trabajo|\
                               Razón del Margen de Seguridad|\
                               Razón Severa o Prueba del Ácido|\
                               Razón de Protección al Pasivo Total|\
                               Razón de Protección al Pasivo Circulante|\
                               Razón del Patrimonio Inmovilizado|\
                               Razón de Productividad o índice de Rentabilidad|\
                               Razón de Protección al Capital Pagado|\
                               Rotación de Cuentas y Documentos por Cobrar";
    
    NSArray *catalogoRazones = [contentCatalogoRazones componentsSeparatedByString:@"|"];
    
    catalogoRazonesDAO = [[CatalogoRazonesDAO alloc] initContext];
    
    int index = 0;
    if([[catalogoRazonesDAO getAllRazones] count] == 0) {
        for(NSString *catalogoRazon in catalogoRazones) {
            CatalogoRazones *razon = [catalogoRazonesDAO getNewCatalogoRazon];
            razon.nombre = catalogoRazon;
            razon.index = [NSNumber numberWithInt:index];
            
            NSError *error = nil;
            
            [catalogoRazonesDAO.managedObjectContext save:&error];
            
            index++;
        }
    } 
    
    NSLog(@"Número de catalogo de razones: %d", [[catalogoRazonesDAO getAllRazones] count]);
    
}

- (void) initCatalogoCuentas
{
    contentCatalogoCuenta = @"Efectivo, caja y bancos|\
                              Inversión en instrumentos financieros|\
                              Pagos anticipados|\
                              Cuentas por cobrar|\
                              Estimación de Cuentas incobrables|\
                              Prestamos y anticipos al personal|\
                              Inventario de Materia Prima - E. Industrial/E. Comercial|\
                              Inventario de Producción en Proceso|\
                              Inventario de Producto Terminado|\
                              Anticipo de impuestos|\
                              Iva a favor|\
                              Otros activos|\
                              Inmueble|\
                              Depreciación acumulada de inmueble|\
                              Maquinaria|\
                              Depreciación acumulada de maquinaria|\
                              Equipo de transporte|\
                              Depreciación acumulada de transporte|\
                              Terrenos|\
                              Depreciación de Terrenos|\
                              Mobiliario y Equipo de oficina|\
                              Depreciación acumulada de mobiliario y equipo|\
                              Intangigles|\
                              Amortización acumulada de intangiles|\
                              Cuentas por pagar corto plazo|\
                              Proveedores corto plazo|\
                              Acreedores corto plazo|\
                              Anticipos cobrados por anticipado|\
                              Iva por pagar|\
                              Impuestos por pagar|\
                              Cuentas por pagar largo plazo|\
                              Proveedores largo plazo|\
                              Acreedores largo plazo|\
                              Capital social pagado|\
                              Capital social no pagado|\
                              Aportaciones para futuros aumentos de capital|\
                              Prima en venta de acciones|\
                              Utilidad del ejercicio|\
                              Utilidad retenida|\
                              Perdidas acumuladas|\
                              Ventas|\
                              Devoluciones, rebajas y descuentos de Ventas|\
                              Inventario Inicial de Materia Prima - E. Industria/Comercial|\
                              Compra Netas de Materia Prima - E. Industria/Comercial|\
                              Inventario Final de Materia Prima - E. Industria/Comercial|\
                              Mano de Obra - E. Industria|\
                              Costos Indirectos de Fabricación - E. Industria|\
                              Inventario Inicial de Productos en Proceso - E. Industria|\
                              Inventario Final de Productos en Proceso - E. Industria|\
                              Inventario Inicial de Producto Terminado - E. Industria|\
                              Inventario Final de Producto Terminado - E. Industria|\
                              Gastos de ventas|\
                              Gastos de administración|\
                              Otros gastos|\
                              Otros ingresos|\
                              Utilidad Bruta|\
                              PTU|\
                              Impuestos a la utilidad|\
                              Utilidad Neta|\
                              Plazo Teorico de Cobro|\
                              Saldo Inicial de Clientes|\
                              Saldo Final de Clientes|\
                              Ventas a Crédito|\
                              Devolución, rebajas y descuentos de Ventas a Crédito|\
                              Compras netas de Materia Prima a Crédito - E. Industrial/E. Comercial|\
                              Saldo Inicial de Proveedores a Corto y Largo Plazo|\
                              Número de días del ejercicio";
    
    NSArray *catalogoCuentas = [contentCatalogoCuenta componentsSeparatedByString:@"|"];
    
    catalogoCuentaDAO = [[CatalogoCuentaDAO alloc] initContext];
    
    int index = 0;
    if([[catalogoCuentaDAO getAllCuentas] count] == 0) {
        for(NSString *catalogoCuenta in catalogoCuentas) {
            CatalogoCuentas *cuenta = [catalogoCuentaDAO getNewCatalogoCuenta];
            cuenta.nombre = catalogoCuenta;
            cuenta.index = [NSNumber numberWithInt:index];
            
            NSError *error = nil;
            
            [catalogoCuentaDAO.managedObjectContext save:&error];
            
            index++;
        }
    } 
    
    NSLog(@"Número de catalogo de cuentas: %d", [[catalogoCuentaDAO getAllCuentas] count]);
}

@end
