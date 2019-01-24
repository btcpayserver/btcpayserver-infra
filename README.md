# btcpayserver-infra
The docker compose running several services for the BTCPay Server community

It contains the following services for the community:

* Slack invite
* Mattermost server

## How to use

Create a `.env` file with the following content:

```bash
SLACK_TOKEN=xoxp-secret-token
SLACK_HOST=slack.btcpayserver.org
SLACK_URL=forkbitpay.slack.com
MATTERMOST_HOST=chat.btcpayserver.org
TELEGRAM_TOKEN=...
```
Where: 
* `SLACK_TOKEN` is your secret slack token
* `SLACK_HOST` is the slack invite domain name
* `SLACK_URL` is the slack website of your community
* `MATTERMOST_HOST` is the mattermost domain name
* `BOT_NICKNAME` is the name of the bot on mattermost
* `BOT_PASS` is the pass of the bot on mattermost
* `TELEGRAM_TOKEN` is the telegram token
* `GITTER_TOKEN` is the gitter token


This assume that `SLACK_HOST` and `MATTERMOST_HOST` are pointing to your server.
Then you can run:

```bash
./update.mattermost.sh
docker-compose up -d
```

## Aditional settings

We advise you to change `PluginSettings/EnableUploads` to true manually (`/var/lib/docker/volumes/root_mm-config/_data/config.json`).

