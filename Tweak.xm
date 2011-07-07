#import <UIKit/UIKit.h>

%hook SBAwayLockBar
-(void)_setLabel:(id)label {

NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.abart997.labelslide.plist"];

NSString *text = (id)[plist objectForKey:@"label"];

static BOOL value = NO;
static BOOL values = NO;
static BOOL valuet = NO;

value = [[plist objectForKey:@"enabled"]boolValue];
values = [[plist objectForKey:@"customText"]boolValue];
valuet = [[plist objectForKey:@"thetime"]boolValue];

if(!value){
return %orig;
} else if(values){
label = text;
}
%orig;

if(!value){
return %orig;
} else if(valuet){


	NSDateFormatter *dt = [[NSDateFormatter alloc] init];
	[dt setDateStyle:NSDateFormatterNoStyle];
	[dt setTimeStyle:NSDateFormatterShortStyle];
	[dt setDateFormat:@"dd-MM-YYYY"];
	NSString *time = [dt stringFromDate:[NSDate date]];
	[dt release];

label = time;


}

%orig;



}
%end


