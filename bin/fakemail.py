#!/usr/bin/env python
#
# fakemail (Python version)
#
# $Id: fakemail.py,v 1.4 2011/06/09 16:57:10 ashtong Exp $


import asyncore
import getopt
import os
import signal
import smtpd
import socket
import sys


class FakeServer(smtpd.SMTPServer):

    RECIPIENT_COUNTER = {}

    def __init__(self, localaddr, remoteaddr, path):
        smtpd.SMTPServer.__init__(self, localaddr, remoteaddr)
        self.path = path

    def process_message(self, peer, mailfrom, rcpttos, data):
        message("Incoming mail")
        for recipient in rcpttos:
            message("Capturing mail to %s" % recipient)
            count = self.RECIPIENT_COUNTER.get(recipient, 0) + 1
            self.RECIPIENT_COUNTER[recipient] = count
            filename = os.path.join(self.path, "%s.%s" % (recipient, count))
            filename = filename.replace("<", "").replace(">", "")
            f = file(filename, "w")
            f.write(data + "\n")
            f.close()
            message("Mail to %s saved" % recipient)
        message("Incoming mail dispatched")


def script_name():
    return os.path.basename(sys.argv[0])


def usage():
    print "Usage: %s [OPTIONS]" % script_name()
    print """
OPTIONS
        --host=<localdomain>
        --port=<port number>
        --path=<path to save mails>"""


def quit(reason=None):
    global progname
    text = "Stopping %s" % progname
    if reason is not None:
        text += ": %s" % reason
    message(text)
    sys.exit()


def message(text):
    print text


def handle_signals():
    for name in ("SIGINT", "SIGTERM", "SIGHUP"):
        try:
            sig = getattr(signal, name)
        except AttributeError:  # SIGHUP not available on some platforms
            pass
        else:
            signal.signal(sig, lambda signmum, frame: quit())


def read_command_line():
    try:
        optlist, args = getopt.getopt(
            sys.argv[1:], "", ["host=", "port=", "path="])
    except getopt.GetoptError:
        usage()
        sys.exit(2)
    # Set defaults
    host = "localhost"
    port = 8025
    path = os.getcwd()
    for opt, arg in optlist:
        if opt == "--host":
            host = arg
        elif opt == "--port":
            port = int(arg)
        elif opt == "--path":
            path = arg
    return host, port, path


def main():
    global progname
    handle_signals()
    host, port, path = read_command_line()
    message("Starting %s" % progname)
    try:
        server = FakeServer((host, port), None, path)
    except socket.error, e:
        quit(str(e))
    message("Listening on port %d" % port)
    try:
        asyncore.loop()
    except KeyboardInterrupt:
        quit()


if __name__ == "__main__":
    progname = os.path.basename(sys.argv[0])
    main()
