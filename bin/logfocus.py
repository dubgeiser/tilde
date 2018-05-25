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

from AppKit import NSWorkspace
from datetime import datetime
from time import sleep

last_active_name = None

while True:
    active_app = NSWorkspace.sharedWorkspace().activeApplication()
    if active_app['NSApplicationName'] != last_active_name:
        last_active_name = active_app['NSApplicationName']
        print('%s: %s [%s]' % (
            datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
            active_app['NSApplicationName'],
            active_app['NSApplicationPath']
            ))
    sleep(1)
