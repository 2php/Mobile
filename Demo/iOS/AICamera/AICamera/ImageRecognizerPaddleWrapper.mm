//
//  ImageRecognizerPaddleWrapper.m
//  SSDDemo
//
//  Created by Nicky Chan on 11/7/17.
//  Copyright © 2017 PaddlePaddle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageRecognizerPaddleWrapper.h"
#include "paddle_image_recognizer.h"

@interface ImageRecognizerPaddleWrapper () {
    ImageRecognizer recognizer;
}
@end

@implementation ImageRecognizerPaddleWrapper


- (instancetype)init {
    self = [super init];
    if (self)
    {
        int normedHeight = 300;
        int normedWidth  = 300;
        int channel = 3;
        const std::vector<float> means({104, 117, 124});
        
        NSBundle* bundle = [NSBundle mainBundle];
        NSString* resourceDirectoryPath = [bundle bundlePath];
        NSString* path = [resourceDirectoryPath stringByAppendingString: @"/vgg_ssd_net.paddle"];
        
        self->recognizer.init([path UTF8String], normedHeight, normedWidth, channel, means);
        
    }
    return self;
}

- (void)inference:(unsigned char *)pixels withHeight:(int)height withWidth:(int)width {
    ImageRecognizer::Result result;
    int channel = 4;
    self->recognizer.infer(pixels, height, width, channel, result);
    NSLog(@"height = %llu", result.height);
    
}

- (void)destroy {
    self->recognizer.release();
}


@end
