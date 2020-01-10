//
//  Header.h
//  RVT
//
//  Created by SC on 2019/3/30.
//  Copyright © 2019 SC. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import <Masonry/Masonry.h>
#import <GPUImage/GPUImage.h>
#define WeakObj(o) try{}@finally{} __weak typeof(o) o##Weak = o;
#define StrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;
#endif /* Header_h */
