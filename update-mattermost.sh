#!/usr/bin/env bash

MATTERMOST_FILE="matterbridge.toml"
cp matterbridge.template.toml "$MATTERMOST_FILE"
export $(grep -v '^#' ".env" | xargs)

sed -i -e "s|{BOT_NICKNAME}|$BOT_NICKNAME|g" "$MATTERMOST_FILE"
sed -i -e "s|{BOT_PASS}|$BOT_PASS|g" "$MATTERMOST_FILE"
sed -i -e "s|{SLACK_TOKEN}|$SLACK_TOKEN|g" "$MATTERMOST_FILE"
sed -i -e "s|{TELEGRAM_TOKEN}|$TELEGRAM_TOKEN|g" "$MATTERMOST_FILE"
sed -i -e "s|{GITTER_TOKEN}|$GITTER_TOKEN|g" "$MATTERMOST_FILE"
sed -i -e "s|{MATTERMOST_HOST}|$MATTERMOST_HOST|g" "$MATTERMOST_FILE"

echo "Generated $MATTERMOST_FILE from .env file parameters"
