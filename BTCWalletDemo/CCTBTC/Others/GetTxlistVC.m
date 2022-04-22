//
//  GetTxlistVC.m
//  CCTBTC
//
//  Created by Helios on 2019/2/20.
//  Copyright © 2019 Helios. All rights reserved.
//

#import "GetTxlistVC.h"
#import <CCTBTCLib/CCTBTCLib.h>

@interface GetTxlistVC ()

@property (weak, nonatomic) IBOutlet UITextField *addText;

@end

@implementation GetTxlistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"交易记录";
}

- (IBAction)btnAction:(id)sender {
    
    /**
     需要完整的 CCTBTCLib 库 源代码，请加我的微信：lyp_9527 收费200元（BTC全套库+Demo代码）,支持BTC，USDT交易，签名保证100%通过。
     **/
    
    _addText.text = @"1B4UDft3TyRhoygLnMyyoFrbSkjpCD8vEJ";
    
    if(_addText.text.length == 0){
        return;
    }
    
    [CCTBTCLib getTxlistByAddress:_addText.text Network:mainnet Path:btcMainnet Page:0 resultBlock:^(NSArray *array, BOOL suc) {
        
        if(suc){
            NSLog(@"%@",array);
        }else{
            NSLog(@"查询失败");
        }
    }];
}

@end
