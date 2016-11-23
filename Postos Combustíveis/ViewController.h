//
//  ViewController.h
//  Postos Combustíveis
//
//  Created by Fabricio on 15/11/16.
//  Copyright © 2016 Fabricio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostoDAO.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *preco_gasolina_comum;

@property (weak, nonatomic) IBOutlet UITextField *preco_gasolina_aditivada;

@property (weak, nonatomic) IBOutlet UITextField *preco_etanol;

@property (weak, nonatomic) IBOutlet UITextField *preco_diesel;

@property (weak, nonatomic) IBOutlet UITextField *nome_posto;

@property (weak, nonatomic) IBOutlet UITextField *bandeira_posto;

@property (weak, nonatomic) IBOutlet UITextField *endereco_posto;

@property (weak, nonatomic) IBOutlet UILabel *latitude_posto;

@property (weak, nonatomic) IBOutlet UILabel *longitude_posto;

@property Posto *posto;

@property PostoDAO *dao;

@end

