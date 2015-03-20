//
//  View2.h
//  Navigation
//
//  Created by Ana Elisa Pessoa Aguiar on 17/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dicionario.h"

@interface View2 : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property int flagColor;

-(void)animacaoLetra: (UILabel*)label;
-(void)animacaoPalavra: (UIButton*) label;
-(void)animacaoImagem: (UIImageView *) label;

@end
