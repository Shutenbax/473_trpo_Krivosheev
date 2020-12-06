#!bin/sh

while true
do

	redis-cli --eval lab-12-re_krivosheeev.lua
	sleep 1

done
