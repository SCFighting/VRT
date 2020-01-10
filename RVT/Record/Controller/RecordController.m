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
@property (nonatomic , strong ) GPUImagePicture *picture;
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
    [self.picture addTarget:self.gpuImageView];
    [self.picture processImage];
    
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
    [self.picture removeAllTargets];
    [self.gpuImageView removeFromSuperview];
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

-(GPUImagePicture *)picture
{
    if (_picture == nil) {
        _picture = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:@"IMG_0146"]];
    }
    return _picture;
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

-(GPUImageUIElement *)vieweEement
{
    if (_vieweEement == nil) {
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 45)];
        [textLabel setFont:[UIFont systemFontOfSize:14]];
        [textLabel setText:@"限额是"];
        [textLabel setTextColor:[UIColor redColor]];
        _vieweEement = [[GPUImageUIElement alloc] initWithView:textLabel];
    }
    return _vieweEement;
}

@end
