#!/usr/bin/liquidsoap
#set("log.file.path","/app/liquidsoap/channel1.log")
output.icecast(%mp3(bitrate=320),
host = "localhost",
port = 8000,
name = "Channel 1",
description = "Channel 1",
genre = "HCPlayer",
url = "http://sautiyaumoja.lp-umoja.com/channel1",
icy_metadata = "guess",
password = "channel1",
user = "channel1",
mount = "/channel1",
public=true,
fallible=true,
mksafe(playlist("/app/playlist/channel1.m3u", reload_mode="watch", mode="normal")))

