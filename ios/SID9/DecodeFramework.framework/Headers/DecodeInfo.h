//
//  DecodeInfo.h
//  DecodeFramework
//
//  Created by D9-XieP on 2017/8/28.
//  Copyright © 2017年 D9-XieP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface DecodeInfo : NSObject

+ (DecodeInfo *)defaultManager;

- (NSString *)getDeviceBuffer:(CMSampleBufferRef)sampleBuffer Complete:(void(^)())complete;

@property (strong, nonatomic)  NSString * codeContent;

@end
