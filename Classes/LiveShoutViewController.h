//
//  LiveShoutViewController.h
//  LiveShout
//
//  Created by Niall Kelly on 24/05/2010.
//  Copyright Ecliptic Labs 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "SettingsViewController.h"
#import "AudioRecorder.h"

@interface LiveShoutViewController : UIViewController <SettingsViewControllerDelegate> {
	
	IBOutlet UIView *meterView;
	
	NSString *host_IP_address;
	NSString *host_port;
	
	CGRect initialMeterFrame;
	
	NSTimer *meterTimer;
	
	AudioRecorder *recorder;
	
	NSURL *soundFileURL;
	Float32 *audioLevels;
	Float32 *peakLevels;
	
	IBOutlet UITextField *addressTextField;
	IBOutlet UITextField *mountTextField;
	IBOutlet UIBarButtonItem	*statusButton;
}

@property (nonatomic, retain) NSString *host_IP_address;
@property (nonatomic, retain) NSString *host_port;
@property (nonatomic, retain) NSString *host_mount_point;


@property (nonatomic, retain) NSTimer *meterTimer;
@property (nonatomic, retain) AudioRecorder *recorder;
@property (nonatomic, retain) NSURL *soundFileURL;

@property (nonatomic, retain) IBOutlet UITextField *addressTextField;
@property (nonatomic, retain) IBOutlet UITextField *mountTextField;
- (IBAction)beginStream;
- (IBAction)beginMicInput;
- (IBAction)stopMicInput;
- (IBAction)flipToSettings;

@end

