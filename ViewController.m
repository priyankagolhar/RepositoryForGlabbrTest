//
//  ViewController.m
//  GlabbrTest
//
//  Created by Apple on 11/4/17.
//  Copyright © 2017 chiselcut. All rights reserved.
//

#import "ViewController.h"
#import "GlabbrGateway.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupTCPConnection];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setupTCPConnection
{
    //Create TCP Socket
    CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, (CFStringRef)@"37.247.116.67", 5224, &readStream, &writeStream);
    [self openConnection];
    
}
-(void)openConnection
{
    //bridging for converting core foundation stream to NSStream
    outputStream = (__bridge NSOutputStream *)writeStream;
    inputStream = (__bridge NSInputStream *)readStream;
    
    //set delegate
    [outputStream setDelegate:self];
    [inputStream setDelegate:self];
    
    //scheduling operation in run loop for avoiding blocking operation
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    //open inputstream and outputstream
    [outputStream open];
    [inputStream open];
    NSDictionary *settings = [ [NSDictionary alloc ]
                              initWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES], @"kCFStreamSSLAllowsExpiredCertificates",
                              [NSNumber numberWithBool:YES], @"kCFStreamSSLAllowsExpiredRoots",
                              [NSNumber numberWithBool:YES], @"kCFStreamSSLAllowsAnyRoot",
                              [NSNumber numberWithBool:NO], @"kCFStreamSSLValidatesCertificateChain",
                              [NSNull null],@"kCFStreamSSLPeerName",
                              @"kCFStreamSocketSecurityLevelNegotiatedSSL",
                              @"kCFStreamSSLLevel",
                              nil ];
    CFReadStreamSetProperty((CFReadStreamRef)inputStream,
                            (CFTypeRef) @"kCFStreamSSLLevel", (CFTypeRef)settings);
    CFWriteStreamSetProperty((CFWriteStreamRef)outputStream,
                             (CFTypeRef) @"kCFStreamSSLLevel", (CFTypeRef)settings);
}

//receive msg for respective streams
-(void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode
{
    if (eventCode == NSStreamEventOpenCompleted) {
        NSLog(@"%@",@"Connection Successful");
    }
    else if (eventCode == NSStreamEventHasBytesAvailable)
    {
        NSLog(@"byts to written");
    }
}
- (IBAction)sendDataButtonTapped:(id)sender {
    //Send data to server
    GlabbrGateway *gGateWay = [[GlabbrGateway alloc]initWith:[_cuidTextField.text intValue]  i:[_intValueTextField.text intValue ]l:[_longValueTextField.text longLongValue] S:_TitleTextField.text];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:gGateWay];
    [outputStream write:[data bytes] maxLength:[data length]];
}

@end
