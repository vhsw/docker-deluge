#!/bin/sh

deluged --do-not-daemonize -c /config -L info &
deluge-web --do-not-daemonize -c /config -L info
