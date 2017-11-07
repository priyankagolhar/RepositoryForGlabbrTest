//
//  ViewController.h
//  GlabbrTest
//
//  Created by Apple on 11/4/17.
//  Copyright © 2017 chiselcut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSStreamDelegate>
{
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    
    NSInputStream *inputStream;
    NSOutputStream *outputStream;
}
@property (weak, nonatomic) IBOutlet UITextField *cuidTextField;
@property (weak, nonatomic) IBOutlet UITextField *intValueTextField;
@property (weak, nonatomic) IBOutlet UITextField *longValueTextField;
@property (weak, nonatomic) IBOutlet UITextField *TitleTextField;

@end

