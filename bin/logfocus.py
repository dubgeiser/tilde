#!/usr/bin/python

''' Log wich application has focus.

Reason:
    I'm occasionally experiencing focus loss when working in an application.
    The current app stays the same (going by the name in the top bar, but the
    focus isn't in the active window anymore, causing me to loose keystrokes.
    Hopefully, running this logger will reveal the guilty app.
    (I am of course suspecting the company virus scanner ;-) )


This needs to be run with the standard Apple-installed Python because we need
AppKit.
'''

from datetime import datetime
from time import sleep

from AppKit import NSWorkspace


#
# configuration:
#   - sleep_time        Amount of seconds to sleep before rechecking app change.
#
conf = {
    'sleep_time' : 1,
}

def print_app_data(app):
    print('%s: %s [%s]' % (
        datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
        app['NSApplicationName'],
        app['NSApplicationPath']
        ))


def track_app_focus_change(sleep_time):
    last_active_name = None
    while True:
        active_app = NSWorkspace.sharedWorkspace().activeApplication()
        if active_app['NSApplicationName'] != last_active_name:
            last_active_name = active_app['NSApplicationName']
            print_app_data(active_app)
        sleep(sleep_time)


def main(conf):
    try:
        track_app_focus_change(conf['sleep_time'])
    except KeyboardInterrupt, e:
        print "\nDone.\n"


if __name__ == '__main__':
    main(conf)
