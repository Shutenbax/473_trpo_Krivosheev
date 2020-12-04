#!/usr/bin/sh

rm -f lab-6_krivosheev.db
cat lab-6_krivosheev.sql | sqlite3 lab-6_krivosheev.db
