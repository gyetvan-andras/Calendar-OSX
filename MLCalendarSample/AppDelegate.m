//
//  AppDelegate.m
//  MLCalendarSample
//
//  Created by András Gyetván on 09/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
- (IBAction)showCalendar:(id)sender;
@property (weak) IBOutlet NSTextField *dateField;
@property (weak) IBOutlet NSDateFormatter *dateFormatter;

@property (weak) IBOutlet NSWindow *window;
@property (strong) NSPopover* calendarPopover;
@property (strong) MLCalendarView*calendarView;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
	self.dateField.stringValue = [self.dateFormatter stringFromDate:[NSDate date]];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
	return YES;
}

- (void) createCalendarPopover {
	NSPopover* myPopover = self.calendarPopover;
	if(!myPopover) {
		myPopover = [[NSPopover alloc] init];
		self.calendarView = [[MLCalendarView alloc] init];
		self.calendarView.delegate = self;
		myPopover.contentViewController = self.calendarView;
		myPopover.appearance = [NSAppearance appearanceNamed:NSAppearanceNameAqua];
		myPopover.animates = YES;
		myPopover.behavior = NSPopoverBehaviorTransient;
	}
	self.calendarPopover = myPopover;
}

- (IBAction)showCalendar:(id)sender {
	[self createCalendarPopover];
	NSDate* date = [self.dateFormatter dateFromString:self.dateField.stringValue];
	self.calendarView.date = date;
	self.calendarView.selectedDate = date;
	NSButton* btn = sender;
	NSRect cellRect = [btn bounds];
	[self.calendarPopover showRelativeToRect:cellRect ofView:btn preferredEdge:NSMaxYEdge];
}

- (void) didSelectDate:(NSDate *)selectedDate {
	[self.calendarPopover close];
	self.dateField.stringValue = [self.dateFormatter stringFromDate:selectedDate];
}

@end
