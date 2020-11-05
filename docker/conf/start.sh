#!/bin/bash
su -c "/usr/bin/icecast2 -c /etc/icecast2/icecast.xml" -s /bin/sh hcplayer </dev/null &>/dev/null &
su -c "/app/liquidsoap/channel1.liq" -s /bin/sh hcplayer </dev/null &>/dev/null &
sleep infinity
