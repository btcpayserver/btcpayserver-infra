# btcpayserver-infra
The docker compose running several services for the BTCPay Server community

It contains the following services for the community:

* Slack invite.  ([slack.btcpayserver.org](https://slack.btcpayserver.org))
* Mattermost server ([chat.btcpayserver.org](https://chat.btcpayserver.org))
* Bot which bridge IRC, MatterMost, Slack and Telegram.
* BTCPay Server Web Installer/Configurator.  ([install.btcpayserver.org](https://install.btcpayserver.org))

## How to use

Create a `.env` file with the following content:

```bash
SLACK_TOKEN=xoxp-secret-token
MATTERMOST_HOST=chat.btcpayserver.org
CONFIGURATOR_HOST=install.btcpayserver.org
TELEGRAM_TOKEN=...
FIREFLY_HOST=firefly.btcpayserver.org
```
Where: 
* `SLACK_TOKEN` is your secret slack token
* `MATTERMOST_HOST` is the mattermost domain name
* `BOT_NICKNAME` is the name of the bot on mattermost
* `BOT_PASS` is the pass of the bot on mattermost
* `TELEGRAM_TOKEN` is the telegram token
* `CONFIGURATOR_HOST` is the configurator domain name
* `FIREFLY_HOST` is the our firefly domain name


This assume that `MATTERMOST_HOST`, and `CONFIGURATOR_HOST` are pointing to your server.
Then you can run:

```bash
./update-mattermost.sh
docker-compose up -d
```

## Aditional settings

We advise you to change `PluginSettings/EnableUploads` to true manually (`/var/lib/docker/volumes/root_mm-config/_data/config.json`).

