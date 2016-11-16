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
        UIBarButtonItem *botao = [[UIBarButtonItem alloc] initWithTitle:@"Adicionar" style:UIBarButtonItemStylePlain target:self action: @selector(adiciona)];
        self.navigationItem.rightBarButtonItem = botao;
        self.navigationItem.title = @"Novo Posto";
        self.dao = [PostoDAO postoDaoInstance];

    }
    return self;
}

-(void) adiciona {
    Posto *posto = [Posto new];
    posto.nome_posto = self.nome_posto.text;
    posto.bandeira_posto = self.bandeira_posto.text;
    posto.endereco_posto = self.endereco_posto.text;
    posto.preco_gasolina = self.preco_gasolina.text;
    posto.preco_diesel = self.preco_diesel.text;
    posto.preco_etanol = self.preco_etanol.text;
    
    [self.dao adicionaPosto:posto];
    
    NSLog(@"%@", self.dao.listaPostos);
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
