## keepon.sh

Rather than looking for a particular application window being active, this
script utilizes `pactl`'s sinks short list to see whether or not any
device is in active use (i.e. making any sound at all).

I searched several times for ways to add overrides for specific
applications in the DPMS settings so that I could prevent my monitor from
sleeping when YouTube was on, but most solutions required a bunch of
changes that were mostly nuisances.

The solution was to just see if any ___AUDIO SINK___ is running instead.

I used iye's lightsOn script [here](github.com/iye/lightsOn) as a base
for the script and concept, but really only maintained some of the
features that are outside of my setup, like resetting xscreensaver and 
kscreensaver, while adding in a check against xdg-screensaver.

I absolutely did not strive for legibility in this, only for it to be
fairly minimal and use as few resources as I could get it to within
bash.

## Requirements

- pavucontrol

## Usage

The best way I could consider this would be to add the keepon script
to your `.Xinitrc` with the line `your/path/to/keepon.sh &`.  
A time delay can be specified by passing a number (in seconds) to the
script or setting the value manually on line 7 at `delay= <some number>`.

850 is my default for this because my minimum value from `xset dpms -q`
between Standby, Suspend, and Off is 900.
