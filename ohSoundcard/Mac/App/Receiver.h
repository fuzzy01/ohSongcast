
#import <Cocoa/Cocoa.h>
#import "Preferences.h"


// Declaration of a class to hold receiver data
@interface Receiver : NSObject
{
    NSString* udn;
    NSString* room;
    NSString* group;
    NSString* name;
    void* iPtr;
    NSObject* iLock;
}

@property (assign) NSString* udn;
@property (assign) NSString* room;
@property (assign) NSString* group;
@property (assign) NSString* name;

- (id) initWithPtr:(void*)aPtr;
- (id) initWithPref:(PrefReceiver*)aPref;
- (void) updateWithPtr:(void*)aPtr;
- (PrefReceiver*) convertToPref;
- (EReceiverState) status;
- (void) play;
- (void) stop;
- (void) standby;

@end



