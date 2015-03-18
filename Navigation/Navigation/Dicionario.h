//
//  Dicionario.h
//  Navigation
//
//  Created by Ana Elisa Pessoa Aguiar on 18/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dicionario : NSObject

@property NSArray *letras;
@property NSArray *palavras;
@property NSArray *imagens;
@property int i;
@property UIImageView *imagem;
@property UIButton *botao;

+(Dicionario *) instance;
-(void)next;
-(void)back;

@end
