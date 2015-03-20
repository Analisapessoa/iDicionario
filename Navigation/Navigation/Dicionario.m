//
//  Dicionario.m
//  Navigation
//
//  Created by Ana Elisa Pessoa Aguiar on 18/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Dicionario.h"

@implementation Dicionario


static Dicionario *instancia = nil;

+(Dicionario *) instance {
    if (!instancia) {
        instancia = [[super alloc]init];
    }
    return instancia;
}

-(void)next {
    _i++;
}
-(void)back {
    _i--;
}


@end
