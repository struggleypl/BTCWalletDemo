//
//  BTCGetBalanceVC.m
//  CCTBTC
//
//  Created by Helios on 2019/2/20.
//  Copyright © 2019 Helios. All rights reserved.
//

#import "BTCGetBalanceVC.h"
#import <CCTBTCLib/CCTBTCLib.h>

@interface BTCGetBalanceVC ()

@property (weak, nonatomic) IBOutlet UITextField *addText;

@property (weak, nonatomic) IBOutlet UILabel *balanceT;


@end

@implementation BTCGetBalanceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"查询余额";
}

- (IBAction)btcAction:(id)sender {
    
    /**
     需要完整的 CCTBTCLib 库 源代码，请加我的微信：lyp_9527 收费200元（BTC全套库+Demo代码）,支持BTC，USDT交易，签名保证100%通过。
     **/
    
    _addText.text = @"1B4UDft3TyRhoygLnMyyoFrbSkjpCD8vEJ";
    
    if(_addText.text.length == 0){
        return;
    }
    
    [CCTBTCLib getBalanceByAddress:_addText.text Network:mainnet resultBlock:^(NSDictionary *dict, BOOL suc) {
        
        if(suc){
            //得到的值要除以 100000000  不要用float，double处理 要用NSDecimalNumber
            NSLog(@"%@",dict);
            self.balanceT.text = [NSString stringWithFormat:@"%@",dict[self.addText.text][@"final_balance"]];
        }else{
            NSLog(@"查询失败");
        }
    }];
}

@end
