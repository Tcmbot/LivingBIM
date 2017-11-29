//
//  Wrapper.h
//  LivingBIM
//
//  Created by Morio Ramdenbourg on 10/25/17.
//  Copyright © 2017 CAEE. All rights reserved.
//

#ifndef Wrapper_h
#define Wrapper_h

#import <Foundation/Foundation.h>
#import <Structure/Structure.h>
#import <Structure/StructureSLAM.h>

@interface ModelWrapper: NSObject

-(id)init;
-(NSObject*)getVC;
-(void)setCaptureTime: (NSDate *) newTime;
-(void)save: (NSData *)zipData;
-(void)addFrame: (NSDate*) time colorFrame: (STColorFrame *) colorFrame depthFrame: (STDepthFrame *) depthFrame;

@end

#endif /* Wrapper_h */