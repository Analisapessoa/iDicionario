//
//  LetraBViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraViewController.h"
#import "View1.h"

@interface View1 ()

@end

@implementation View1

{
    int i;
    UIButton *botao;
    UIImageView *imagem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _letras = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",
              @"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
    _palavras = [NSArray arrayWithObjects:@"Abelha",@"Bola",@"Cão",@"Dinossauro",@"Elefante",@"Foca",@"Gato",@"Hipopótamo",@"Indio",@"Jaboti",@"Kiwi",@"Leão",
                @"Macaco",@"Nemo",@"Ovelha",@"Pica-Pau",@"Queijo",@"Rato",@"Sapo",@"Tenis",@"Urso",@"Vela",@"Walkman",
                @"Xícara",@"Yakult",@"Zebra", nil ];
    _imagens = [[NSArray alloc ] initWithObjects:[UIImage imageNamed:@"A.jpg"],[UIImage imageNamed:@"B.jpg"],[UIImage imageNamed:@"C.jpg"],[UIImage imageNamed:@"D.jpg"],[UIImage imageNamed:@"E.jpg"],[UIImage imageNamed:@"F.jpg"],[UIImage imageNamed:@"G.jpg"],[UIImage imageNamed:@"H.jpg"],[UIImage imageNamed:@"I.jpg"],[UIImage imageNamed:@"J.jpg"],[UIImage imageNamed:@"K.jpg"],[UIImage imageNamed:@"L.jpg"],[UIImage imageNamed:@"M.jpg"],[UIImage imageNamed:@"N.jpg"],[UIImage imageNamed:@"O.jpg"],[UIImage imageNamed:@"P.jpg"],[UIImage imageNamed:@"Q.jpg"],[UIImage imageNamed:@"R.jpg"],[UIImage imageNamed:@"S.jpg"],[UIImage imageNamed:@"T.jpg"],[UIImage imageNamed:@"U.jpg"],[UIImage imageNamed:@"V.jpg"],[UIImage imageNamed:@"W.jpg"],[UIImage imageNamed:@"X.jpg"],[UIImage imageNamed:@"Y.jpg"],[UIImage imageNamed:@"Z.jpg"],nil];
    
    i=0;
    
    self.title = _letras[i];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    UIBarButtonItem *back = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem=back;
    
    
    
    imagem = [[UIImageView alloc] initWithFrame:CGRectMake(40, 40, 200, 200)];
    imagem.center = self.view.center;
    [imagem setImage: _imagens[i]];
    [self.view addSubview:imagem];
    
    botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle: _palavras[i] forState:UIControlStateNormal];
    [botao setFrame:CGRectMake(140, 100, 100, 100)];
    [botao sizeToFit];
    
    [self.view addSubview:botao];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
  In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  Get the new view controller using [segue destinationViewController].
  Pass the selected object to the new view controller.
 }
 */



@end
