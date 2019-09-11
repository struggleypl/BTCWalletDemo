# BTCWalletDemo
BTC钱包(基于CoreBitcoin库开发)：  
功能：  
1、创建钱包  
2、通过私钥导入钱包  
3、通过助记词导入钱包  
4、查询余额  
5、查询交易记录 
6、发起交易

//path类型

typedef enum Bip44PathType{

btcMainnet = 0,   //"m/44'/0'/0'"
btcTestnet,       //"m/44'/1'/0'"
btcSegwitMainnet, //"m/49'/0'/0'"
btcSegwitTestnet  //"m/49'/1'/0'"
}Bip44Path;


//网络节点类型

typedef enum NetworkType{

mainnet = 0,   //"m/44'/0'/0'"   主网络 线上网络
testnet,       //"m/44'/1'/0'"   测试网络
}Network;


@class BTCMnemonic;

@interface CCTBTCLib : NSObject

/**
创建钱包
*/


```
+(void)createWalletWithNewwork:(Network)net
Path:(Bip44Path)path
password:(NSString *)pwd
resultBlock:(void(^)(NSString *private,NSString *address,NSString *words))block;
```


/**
导入钱包：通过私钥
*/

```
+(void)importWalletByPrivateKey:(NSString *)privateKey
Newwork:(Network)net
resultBlock:(void(^)(NSString *private,NSString *address))block
error:(void(^)(void))errorblock;
```


/**
导入钱包：通过助记词
*/

```
+(void)importWalletByMnemonic:(NSString *)mnemonicStr
Newwork:(Network)net
Path:(Bip44Path)path
password:(NSString *)pwd
resultBlock:(void(^)(NSString *private,NSString *address))block
error:(void(^)(void))errorblock;
```



```
+(BTCMnemonic *)generateMnemonicPassphrase:(NSString *)phrase withPassword:(NSString *)password;
```


/**
查询余额
*/

```
+(void)getBalanceByAddress:(NSString *)address
Network:(Network)net
resultBlock:(void(^)(NSDictionary *dict,BOOL suc))block;
```


/**
查询交易记录
*/

```
+(void)getTxlistByAddress:(NSString *)address
Network:(Network)net
Path:(Bip44Path)path
Page:(NSInteger)page
resultBlock:(void(^)(NSArray *array,BOOL suc))block;
```


/**
发起交易
*/

```
+(void)TransferByhNetwok:(Network)net
Path:(Bip44Path)path
PayAddress:(NSString *)payAdd     //付款地址
collectAddress:(NSString *)colectAdd  //收款地址
Money:(NSString *)money
PrivateKey:(NSString *)privateKey
Fee:(NSInteger)fee         //手续费
resultBlock:(void(^)(NSString *hashStr,BOOL suc))block;
```



/**
发起交易---助记词
*/

```
+(void)TransferByhNetwok:(Network)net
Path:(Bip44Path)path
PayAddress:(NSString *)payAdd     //付款地址
collectAddress:(NSString *)colectAdd  //收款地址
Money:(NSString *)money
mnemonicStr:(NSString *)mnemonicStr
password:(NSString *)password
Fee:(NSInteger)fee         //手续费
resultBlock:(void(^)(NSString *hashStr,BOOL suc))block;
```





/**
发起USDT交易
*/

```
+(void)USDTTransferByhNetwok:(Network)net
Path:(Bip44Path)path
PayAddress:(NSString *)payAdd     //付款地址
collectAddress:(NSString *)colectAdd  //收款地址
Money:(NSString *)money
PrivateKey:(NSString *)privateKey
Fee:(NSInteger)fee         //手续费
resultBlock:(void(^)(NSString *hashStr,BOOL suc))block;
```




/**
发起USDT交易---助记词
*/

```
+(void)USDTTransferByhNetwok:(Network)net
Path:(Bip44Path)path
PayAddress:(NSString *)payAdd     //付款地址
collectAddress:(NSString *)colectAdd  //收款地址
Money:(NSString *)money
mnemonicStr:(NSString *)mnemonicStr
password:(NSString *)password
Fee:(NSInteger)fee         //手续费
resultBlock:(void(^)(NSString *hashStr,BOOL suc))block;
```





```
+(NSString *)getPassphraseByMnemonic:(BTCMnemonic *)mnemonic;
```

