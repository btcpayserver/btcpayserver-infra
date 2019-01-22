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
```
Where: 
* `SLACK_TOKEN` is your secret slack token
* `SLACK_HOST` is the slack invite domain name
* `SLACK_URL` is the slack website of your community
* `MATTERMOST_HOST` is the mattermost domain name

This assume that `SLACK_HOST` is pointing to your server.
