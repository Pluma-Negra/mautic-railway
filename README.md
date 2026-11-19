# Mautic on Railway

Deploy **Mautic** on Railway. A free and open-source marketing automation platform for managing contacts, building campaigns, and nurturing leads.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/AGR0CM?referralCode=zlMKVb&utm_medium=integration&utm_source=template&utm_campaign=generic)

## What is Mautic?

Mautic is an open-source marketing automation platform that helps businesses manage contacts, send personalized emails, track engagement, and automate customer journeys while maintaining control over their data.

## Features

- 🚀 Self-hosted deployment on Railway
- 📧 Personalized email marketing campaigns
- 👥 Contact management and audience segmentation
- 🔄 Automated campaigns and lead nurturing
- 📝 Landing pages and customizable forms
- 🎯 Lead scoring and website activity tracking
- 📊 Campaign reporting and engagement analytics
- 🔌 REST API for custom integrations
- 💾 MySQL / MariaDB database support
- 🔐 Control over your marketing data

## Quick Start

1. Fork this repository
2. Connect your repository to Railway
3. Provision a MySQL database and configure the connection variables
4. Configure persistent storage and your public application URL
5. Deploy the application and complete the Mautic installation
6. Configure your email delivery provider
7. Enable scheduled tasks and queue workers as required

## Requirements

- A compatible MySQL or MariaDB database
- Persistent storage for configuration and uploaded files
- An SMTP server or supported email delivery provider
- Scheduled tasks for segment updates and campaign execution
- Queue workers when asynchronous processing is enabled

## Documentation

For installation, configuration, and usage, visit the
[official Mautic documentation](https://docs.mautic.org/).

For container deployment details, see the
[official Mautic Docker repository](https://github.com/mautic/docker-mautic).


## Recovering after a Railway redeploy
If Mautic displays *“The site is currently offline”* after a redeploy, try rebuilding the production cache. Run these commands in the **Mautic** service terminal:

```bash
cd /var/www/html
su -s /bin/sh www-data -c 'php bin/console cache:clear --env=prod -vv'
```

This rebuilds the cache as the Apache user (`www-data`). Once the command finishes, reload `/s/login` and verify that you can sign in. If the error persists, check the service’s **Deploy Logs** in Railway.


---

**</> with ♥ by [Pluma Negra](https://plumanegra.com.mx)**
