# btcpayserver-infra
The docker compose running several services for the BTCPay Server community

It contains the following services for the community:

* Slack invite - ([slack.btcpayserver.org](https://slack.btcpayserver.org))
* Mattermost server - ([chat.btcpayserver.org](https://chat.btcpayserver.org))
* Bot which bridge IRC, MatterMost, Slack and Telegram.
* BTCPay Server Web Installer/Configurator - ([install.btcpayserver.org](https://install.btcpayserver.org))
* Plugin Builder - ([plugin-builder.btcpayserver.org](https://plugin-builder.btcpayserver.org))

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
docker compose up -d
```

Please note that previously used `docker-compose` will now likely fail in setup. So ensure you are consistenly using `docker compose` without -.

## Updating Services

If you need to update the version of a service (e.g., Plugin Builder), follow these steps:

1. Update the `docker-compose.yml` file in the repository and push commit.
2. On the server, run the following commands:

```bash
git pull
docker compose up -d
```

On legacy servers, using new `docker compose` instead of `docker-compose`, you may get a warning that volume already exists, but that shouldn't be a problem. We will add a guide on migrating to remove the warning as we further improve the repository.

## Additional settings

We advise you to change `PluginSettings/EnableUploads` to true manually (`/var/lib/docker/volumes/root_mm-config/_data/config.json`).

