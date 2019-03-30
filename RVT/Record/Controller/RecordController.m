//
//  RecordController.m
//  RVT
//
//  Created by SC on 2019/3/28.
//  Copyright © 2019 SC. All rights reserved.
//

#import "RecordController.h"
@interface RecordController ()
@property (nonatomic , strong ) GPUImageVideoCamera *videoCamera;
@property (nonatomic , strong ) GPUImageFilter *defaultFilter;
@property (nonatomic , strong ) GPUImageUIElement *vieweEement;
@property (nonatomic , strong ) GPUImageView *gpuImageView;
@property (nonatomic , strong ) GPUImageMovieWriter *movieWriter;
@property (nonatomic , strong ) UIView *sourceView;
@end

@implementation RecordController

-(void)loadView
{
    [super loadView];
    [self.view addSubview:self.gpuImageView];
    [self.gpuImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.videoCamera addTarget:self.defaultFilter];
    [self.defaultFilter addTarget:self.gpuImageView];
    [self.videoCamera startCameraCapture];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

#pragma mark -- Notification

-(void)deviceOrientationDidChange:(NSNotification *)notification
{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    switch (deviceOrientation) {
        case UIDeviceOrientationFaceUp:
            NSLog(@"屏幕朝上平躺");
            break;
            
        case UIDeviceOrientationFaceDown:
            NSLog(@"屏幕朝下平躺");
            break;
            
        case UIDeviceOrientationUnknown:
            NSLog(@"未知方向");
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"屏幕向左横置");
            self.videoCamera.outputImageOrientation = UIInterfaceOrientationLandscapeRight;
            break;
            
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"屏幕向右橫置");
            self.videoCamera.outputImageOrientation = UIInterfaceOrientationLandscapeLeft;
            break;
            
        case UIDeviceOrientationPortrait:
            NSLog(@"屏幕直立");
            self.videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            self.videoCamera.outputImageOrientation = UIDeviceOrientationPortraitUpsideDown;
            NSLog(@"屏幕直立，上下顛倒");
            break;
            
        default:
            NSLog(@"无法辨识");
            break;
    }
}


#pragma mark -- getter

-(GPUImageVideoCamera *)videoCamera
{
    if (_videoCamera == nil) {
        _videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPresetiFrame1280x720 cameraPosition:AVCaptureDevicePositionBack];
        [_videoCamera setOutputImageOrientation:UIInterfaceOrientationPortrait];
        [_videoCamera addAudioInputsAndOutputs];
    }
    return _videoCamera;
}

- (GPUImageFilter *)defaultFilter
{
    if (_defaultFilter == nil) {
        _defaultFilter = [[GPUImageFilter alloc] init];
    }
    return _defaultFilter;
}

-(GPUImageView *)gpuImageView
{
    if (_gpuImageView == nil) {
        _gpuImageView = [[GPUImageView alloc] init];
    }
    return _gpuImageView;
}

@end
