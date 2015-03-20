//
//  View2.m
//  Navigation
//
//  Created by Ana Elisa Pessoa Aguiar on 17/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "View2.h"
#import <AVFoundation/AVFoundation.h>

@interface View2 ()


@end

@implementation View2

{
    Dicionario *dic;
    UIBarButtonItem *next;
    UIBarButtonItem *back;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    dic = [Dicionario instance];
    
    dic.letras = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",
               @"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
    dic.palavras = [NSArray arrayWithObjects:@"Abelha",@"Bola",@"Cão",@"Dinossauro",@"Elefante",@"Foca",@"Gato",@"Hipopótamo",@"Indio",@"Jaboti",@"Kiwi",@"Leão",
                 @"Macaco",@"Nemo",@"Ovelha",@"Pica-Pau",@"Queijo",@"Rato",@"Sapo",@"Tenis",@"Urso",@"Vela",@"Walkman",
                 @"Xícara",@"Yakult",@"Zebra", nil ];

        dic.imagens = [[NSArray alloc ] initWithObjects:[UIImage imageNamed:@"A"],[UIImage imageNamed:@"B"],[UIImage imageNamed:@"C"],[UIImage imageNamed:@"D"],[UIImage imageNamed:@"E"],[UIImage imageNamed:@"F"],[UIImage imageNamed:@"G"],[UIImage imageNamed:@"H"],[UIImage imageNamed:@"I"], [UIImage imageNamed:@"J"], [UIImage imageNamed:@"K"], [UIImage imageNamed:@"L"], [UIImage imageNamed:@"M"], [UIImage imageNamed:@"N"], [UIImage imageNamed:@"O"], [UIImage imageNamed:@"P"], [UIImage imageNamed:@"Q"], [UIImage imageNamed:@"R"], [UIImage imageNamed:@"S"], [UIImage imageNamed:@"T"], [UIImage imageNamed:@"U"], [UIImage imageNamed:@"V"], [UIImage imageNamed:@"W"], [UIImage imageNamed:@"X"], [UIImage imageNamed:@"Y"], [UIImage imageNamed:@"Z"], nil];
    
//    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    
    self.navigationItem.title = [dic.letras objectAtIndex:dic.i];
    
    next = [[UIBarButtonItem alloc]
            initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next ;
    
    back = [[UIBarButtonItem alloc]
             initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
            self.navigationItem.leftBarButtonItem=back;
    
    dic.botao = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    dic.botao.frame = CGRectMake(0,100, (self.view.frame.size.width),50);
    [dic.botao setTitle:[dic.palavras objectAtIndex:dic.i] forState:UIControlStateNormal];
    
    UILongPressGestureRecognizer *tocarNoBotao = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(animacaoPalavra:)];
    [dic.botao addGestureRecognizer:tocarNoBotao];


    dic.imagem = [[UIImageView alloc] initWithFrame:CGRectMake(15, 200, 300, 300)];
    dic.imagem.image = [dic.imagens objectAtIndex:dic.i];
    
    
    [self.view addSubview:dic.imagem];
    [self.view addSubview:dic.botao];
    [self dispatch];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


//N SEI SE VAI PRECISAR...
//-(void)viewDidAppear:(BOOL)animated
//{
//    ;
//}
//            
//-(void)viewWillAppear:(BOOL)animated
//{
//    ;
//}


-(void)animacaoPalavra:(UILongPressGestureRecognizer *)touch {
    if(touch.state == UIGestureRecognizerStateBegan){
        [UIView animateWithDuration:1.0 animations:^{
            AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc]init];
            AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:[dic.palavras objectAtIndex:dic.i]];
            [utterance setPitchMultiplier:1.15f];
            utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-BR"];
            [utterance setRate:0.03f];
            [synthesizer speakUtterance:utterance];
            dic.botao.transform = CGAffineTransformMakeScale(1.3, 1.3);
        }];
    }
    else if (touch.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:1.0 animations:^{
            dic.botao.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    }
}

-(void)animacaoImagem:(UIImageView *)label
{
    ;
}

-(void) dispatch {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self changeBgColor];
    });
    
}

-(void) changeBgColor {
    
    switch (self.flagColor) {
        case 0:
            self.view.backgroundColor = [UIColor redColor]; self.flagColor++;
            break;
            
        case 1:
            self.view.backgroundColor = [UIColor blueColor];self.flagColor++;
            break;
            
        case 2:
            self.view.backgroundColor = [UIColor greenColor];self.flagColor++;
            break;
            
        case 3:
            self.view.backgroundColor = [UIColor purpleColor];self.flagColor++;
            break;
            
        case 4: {
            self.view.backgroundColor = [UIColor yellowColor];
            self.flagColor = 0;
        }
            break;
            
        default:
            break;
    }
    
    
    [self dispatch];
    
}
            
-(void)next:(id)sender {
    if (dic.i==25) {
        dic.i=0;
    }
    else dic.i++;
    
    View2 *vc = [[View2 alloc] init];
    
    [UIView animateWithDuration:1.0 animations:^{
        dic.imagem.transform = CGAffineTransformMakeScale(0.01, 0.01);
        dic.botao.transform = CGAffineTransformMakeTranslation(0.0, -35.0);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.75
                         animations:^{
                             [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
                             [self.navigationController pushViewController:vc animated:NO];
                             [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
                         }];
        
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }];

}

-(void)back:(id)sender {
    if (dic.i==0) {
        dic.i=25;
    }
    else dic.i--;
    
    
    View2 *vc = [[View2 alloc] init];
    
    [UIView animateWithDuration:1.0 animations:^{
        dic.imagem.transform = CGAffineTransformMakeScale(0.01, 0.01);
        dic.botao.transform = CGAffineTransformMakeTranslation(0.0, -35.0);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.75
                         animations:^{
                             [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
                             [self.navigationController pushViewController:vc animated:NO];
                             [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
                         }];
        
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   UITouch *tocar = [touches anyObject];
    if (tocar.phase == UITouchPhaseBegan)
    {
        [dic.imagem resignFirstResponder];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *tocar = [touches anyObject];
    CGPoint posicao = [tocar locationInView:self.view];
    dic.imagem.center = CGPointMake(posicao.x, posicao.y);
    
}


@end
