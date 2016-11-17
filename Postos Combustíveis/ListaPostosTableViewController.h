//
//  ListaPostosTableViewController.h
//  Postos Combustíveis
//
//  Created by Fabricio on 15/11/16.
//  Copyright © 2016 Fabricio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostoDAO.h"

@interface ListaPostosTableViewController : UITableViewController

@property NSMutableArray *postos;

@property PostoDAO *dao;
@property Posto *postoSelecionado;

@end
