#ifndef HEADER_AUDIODEVICE
#define HEADER_AUDIODEVICE

#include <IOKit/audio/IOAudioDevice.h>
#include "Branding.h"

class SongcastSocket;


// Implementation of the main class for the audio driver.

#define AudioDevice BRANDING_AUDIODEVICE_CLASSNAME

class AudioDevice : public IOAudioDevice
{
    OSDeclareDefaultStructors(AudioDevice);

public:
    SongcastSocket& Socket() { return *iSocket; }

private:
    virtual bool initHardware(IOService* aProvider);
    virtual void free();

    SongcastSocket* iSocket;
};


#endif // HEADER_AUDIODEVICE




