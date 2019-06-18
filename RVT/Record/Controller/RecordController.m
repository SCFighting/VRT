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
@property (nonatomic , strong ) GPUImageTwoInputFilter *fixFilter;
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
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self dismissViewControllerAnimated:YES completion:nil];
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
