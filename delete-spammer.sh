#!/usr/bin/env bash

username="$1"
psql="docker exec -ti root_mattermost_db_1 psql -U mmuser -d mattermost"
userid=$($psql -qtAX -c "SELECT id FROM users WHERE username='$username'")
if [[ $userid ]]; then
$psql -c "DELETE FROM users WHERE username='$username';"
$psql -c "DELETE FROM posts WHERE userid='$userid';"
$psql -c "DELETE FROM channelmembers WHERE userid='$userid';"
find /var/lib/docker/volumes/root_mm-data/_data -type d | grep $userid | tr "\n" "\0" | xargs -0 rm -rf
$psql -c "DELETE FROM sessions WHERE userid='$userid';"
$psql -c "DELETE FROM fileinfo WHERE creatorid='$userid';"
fi