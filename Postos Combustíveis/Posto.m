	//
//  Posto.m
//  Postos Combustíveis
//
//  Created by Fabricio on 15/11/16.
//  Copyright © 2016 Fabricio. All rights reserved.
//

#import "Posto.h"

@implementation Posto
-(NSString *) description {
    NSString *dados = [NSString stringWithFormat:@"Nome: %@ Bandeira: %@ Endereço: %@ Preço Gasolina: %@ Preço Etanol: %@ Preço Diesel; %@", self.nome_posto, self.bandeira_posto, self.endereco_posto, self.preco_gasolina, self.preco_etanol, self.preco_diesel];

    return dados;
    
}
@end
