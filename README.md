# priv_cloudlare_access_sentry

Temporary repository for cloudflareacces Sentry plugin development.

## Install on your On-Premise Sentry instance

TODO: document setup for users

## Plugin Development

Prepare your python environment:

```
pip install setuptools
pip install wheel
```

Prepare your Sentry on Docker environment:

```
cd sentry-docker
./install.sh
# TODO something more is needed between...
docker-compose up -d
```

To reload the plugin code:

```
./build-docker.sh
```

### Django

Note that Sentry is based on `Django 1.9` .
