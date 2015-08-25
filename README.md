# Auth client

Part of a job interview. Authorizes users via custom OAuth2 provider. See
[`auth-server`](https://github.com/D-side/auth-server) for the provider part.

You'll have to set up some variables that point to your OAuth2 provider.
This project uses `figaro` and takes values from `config/application.yml`
falling back to environment variables for missing values. An example is provided
with all the required values.

## Prerequisites:

* Rails 4.2.3 (and whatever it requires)
* PostgreSQL (or, given more time, any other RDBMS)
  * Ubuntu and derivatives may need `libpq-dev`
* Copy `config/*.example.yml` into `config/*.yml` and fill in with your data
  * You need your own Facebook application for that

## Registering client in provider application


Not much, really. If you'll be registering the client, all you need is a
callback
