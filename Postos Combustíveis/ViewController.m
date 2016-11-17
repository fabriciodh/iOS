//
//  ViewController.m
//  Postos Combustíveis
//
//  Created by Fabricio on 15/11/16.
//  Copyright © 2016 Fabricio. All rights reserved.
//

#import "ViewController.h"
#import "Posto.h"	


@interface ViewController ()

@end

@implementation ViewController

-(UIViewController *)initWithCoder: (NSCoder *) aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self){
       
        
        self.dao = [PostoDAO postoDaoInstance];
        
    }
    return self;
}

-(void) adiciona {
    self.posto = [Posto new];
    [self pegaDadosFormulario];
    
    [self.dao adicionaPosto:self.posto];
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void) altera{
    [self pegaDadosFormulario];
    [self.navigationController popViewControllerAnimated:YES];}

-(void) pegaDadosFormulario {
    self.posto.nome_posto = self.nome_posto.text;
    self.posto.bandeira_posto = self.bandeira_posto.text;
    self.posto.endereco_posto = self.endereco_posto.text;
    self.posto.preco_gasolina= self.preco_gasolina.text;
    self.posto.preco_diesel = self.preco_diesel.text;
    self.posto.preco_etanol = self.preco_etanol.text;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *botao = nil;
    if (self.posto){
        botao = [[UIBarButtonItem alloc] initWithTitle:@"Alterar" style:UIBarButtonItemStylePlain target:self action: @selector(altera)];
        self.navigationItem.title = @"Altera Posto";
    } else {
        botao = [[UIBarButtonItem alloc] initWithTitle:@"Adicionar" style:UIBarButtonItemStylePlain target:self action: @selector(adiciona)];
        self.navigationItem.title = @"Novo Posto";
    }
    self.navigationItem.rightBarButtonItem = botao;
    
    if (self.posto){
    self.nome_posto.text = self.posto.nome_posto;
    self.bandeira_posto.text = self.posto.bandeira_posto;
    self.endereco_posto.text = self.posto.endereco_posto;
    self.preco_diesel.text = self.posto.preco_diesel;
    self.preco_etanol.text = self.posto.preco_etanol;
    self.preco_gasolina.text = self.posto.preco_gasolina;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
