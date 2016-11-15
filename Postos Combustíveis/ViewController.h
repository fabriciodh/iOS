//
//  ViewController.h
//  Postos Combustíveis
//
//  Created by Fabricio on 15/11/16.
//  Copyright © 2016 Fabricio. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
@property NSMutableArray *listaPostos;

@property IBOutlet UITextField *nome_posto;
@property IBOutlet UITextField *endereco_posto;
@property IBOutlet UITextField *bandeira_posto;
@property IBOutlet UITextField *preco_gasolina;
@property IBOutlet UITextField *preco_etanol;
@property IBOutlet UITextField *preco_diesel;


@end

