//
//  RSColorPickerAppDelegate.m
//  RSColorPicker
//
//  Created by Ryan Sullivan on 8/12/11.
//  Copyright 2011 Freelance Web Developer. All rights reserved.
//

#import "RSColorPickerAppDelegate.h"

@implementation RSColorPickerAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	colorPicker = [[RSColorPickerView alloc] initWithFrame:CGRectMake(10.0, 40.0, 300.0, 300.0)];
	[colorPicker setDelegate:self];
	[colorPicker setBrightness:1.0];
	[colorPicker setCropToCircle:NO]; // Defaults to YES (and you can set BG color)
	[colorPicker setBackgroundColor:[UIColor clearColor]];
	
	brightnessSlider = [[RSBrightnessSlider alloc] initWithFrame:CGRectMake(10.0, 360.0, 300.0, 30.0)];
	[brightnessSlider setColorPicker:colorPicker];
	[brightnessSlider setUseCustomSlider:YES]; // Defaults to NO
	
	colorPatch = [[UIView alloc] initWithFrame:CGRectMake(10.0, 400.0, 300.0, 30.0)];
	
    // example of preloading a color
    // UIColor * aColor = [UIColor colorWithRed:0.803 green:0.4 blue:0.144 alpha:1];
    // [colorPicker setSelectionColor:aColor];
    // [brightnessSlider setValue:[colorPicker brightness]];
    
	[self.window addSubview:colorPicker];
	[self.window addSubview:brightnessSlider];
	[self.window addSubview:colorPatch];
	
	[self.window makeKeyAndVisible];
	return YES;
}

-(void)colorPickerDidChangeSelection:(RSColorPickerView *)cp {
	colorPatch.backgroundColor = [cp selectionColor];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	/*
	 Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	 If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	/*
	 Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	/*
	 Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background,optionally refresh the user interface.
	 */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	/*
	 Called when the application is about to terminate.
	 Save data if appropriate.
	 See also applicationDidEnterBackground:.
	 */
}


@end
