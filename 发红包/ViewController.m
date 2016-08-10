//
//  ViewController.m
//  发红包
//
//  Created by kyle on 2016/8/8.
//  Copyright © 2016年 bestkayle. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *money;

@property (strong, nonatomic) IBOutlet UILabel *result;
@property (strong, nonatomic) IBOutlet UITextField *count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)mixed:(NSMutableArray *)array{
    for (NSInteger i = 0; i < array.count - 1; i ++) {
        id temp = array[i];
//        NSInteger j = [self chooseIndexForI:i by:array.count];
        NSInteger j = arc4random()%array.count;
        array[i] = array[j];
        array[j] = temp;
    }
}

//- (NSInteger)chooseIndexForI:(NSInteger)I by:(NSInteger)count{
    //NSInteger j = rand()%(count - 1);
    //if (j - I > 2 ||j - I < -2) {
     //   return j;
    //}else{
      //  [self chooseIndexForI:I by:count];
    //}
//    NSInteger j;
//    do {
//        j = arc4random()%(count);
//    } while (j - I < 2 ||j - I > 2);
//    return j;
//}



- (IBAction)allocate:(id)sender {
    NSMutableArray *moneyArr = [NSMutableArray array];
    NSInteger moneyInt = [_money.text integerValue];
    NSInteger countInt = [_count.text integerValue];
    
    for (NSInteger i = 0; i < moneyInt - 1; i ++) {
        [moneyArr addObject:[NSNumber numberWithInteger:i + 1]];
    }
    [self mixed:moneyArr];
    NSArray *remainArray = [moneyArr subarrayWithRange:(NSMakeRange(0, countInt - 1))];
     remainArray = [remainArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSComparisonResult result = [obj1 compare:obj2];
        return result;
    }];
    NSMutableArray *resultArr = [NSMutableArray array];
    for (int i = 0; i < remainArray.count; i ++ ) {
        if ( i == 0) {
            [resultArr addObject:remainArray[i]];
        }
        else{
            [resultArr addObject:[NSNumber numberWithInteger: ([remainArray[i] integerValue] - [remainArray[i - 1] integerValue])]];
        }
        
        
    }
    [resultArr addObject:[NSNumber numberWithInteger: (moneyInt -[remainArray[remainArray.count - 1] integerValue])]];
    NSString *resultStr = [resultArr componentsJoinedByString:@","];
    self.result.text = resultStr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
