//
//  RazonCell.h
//  FinanPort
//
//  Created by Vega on 12/7/12.
//  Copyright (c) 2012 Itnovare Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RazonCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *tituloDeLaRazon;
@property (weak, nonatomic) IBOutlet UIImageView *semaforo;
@property (weak, nonatomic) IBOutlet UILabel *valorDeLaRazon;

@end
