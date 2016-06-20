# Elixir Base

[![Build Status](https://semaphoreapp.com/api/v1/projects/31b68af8b073708a56e4e005bbcba2af4802816d/76140/shields_badge.png)](https://semaphoreapp.com/fs/elixir-base)
[![Test Coverage](https://codeclimate.com/github/fs/elixir-base/badges/coverage.svg)](https://codeclimate.com/github/fs/elixir-base)
[![Code Climate](https://codeclimate.com/github/fs/elixir-base.png)](https://codeclimate.com/github/fs/elixir-base)

Elixir Base is the base Elixir library template used at Flatstack.
It's based on Elixir 1.2.

## Application libs

* [Elixir release manager](https://github.com/bitwalker/exrm) for Elixir's apps release management
* [Guardsafe](https://github.com/DevL/guardsafe) Macros expanding into code that can be safely used in guard clauses
* [Monadex](https://github.com/rob-brown/MonadEx) Improve pipelines with monads

## Development libs

* [Credo](https://github.com/rrrene/credo) for reporting violations of the Elixir style guide
* [Dialyzer](https://github.com/jeremyjh/dialyxir) for static analyse
* [Observer-CLI](https://github.com/zhongwencool/observer_cli) - visualize Erlang nodes on the command line

## Testing libs

* [ExUnit](http://elixir-lang.org/docs/stable/ex_unit/ExUnit.html) for unit testing

## Initializers

## Scripts

* `bin/setup` - setup required libraries and stuff
* `bin/quality` - runs code style check tools
* `bin/ci` - should be used in the CI or locally
* `bin/build` - to build application release
* `bin/server` - to run server locally

## Getting Started

### Prepare dependencies

Elixir v1.2 should be installed.

### Bootstrap application

1. Clone application as new project with original repository named "elixir-base".

   ```bash
   git clone git://github.com/fs/elixir-base.git --origin elixir-base [MY-NEW-PROJECT]
   ```

2. Create your new repo on GitHub and push master into it. Make sure master branch is tracking origin repo.

  ```bash
  git remote add origin git@github.com:[MY-GITHUB-ACCOUNT]/[MY-NEW-PROJECT].git
  git push -u origin master
  ```

3. Run setup script

  ```bash
  bin/setup
  ```

4. Run test and quality suits to make sure all dependencies are satisfied and applications works correctly before making changes.

  ```bash
  bin/ci
  ```

5. Run app

  ```bash
  bin/server
  ```

6. Update README

  Do not forget to update application `README.md` file with detailed information based on the
  existing template.

  ```bash
  mv doc/README_TEMPLATE.md README.md
  # update README.md
  git commit -am "Update README.md"
  ```

## Deployment

### Elixir Release Manager

Use `./bin/build` script to build Elixir application release.

### Heroku

You can use [Elixir buildpack](https://github.com/HashNuke/heroku-buildpack-elixir) for Heroku to be deployed:

* [Heroku Postgres](https://www.heroku.com/postgres) add-on will be used for database.
* [SendGrid](https://devcenter.heroku.com/articles/sendgrid) add-on required to be able to send emails.
* [Rollbar](https://elements.heroku.com/addons/rollbar) add-on could be used to application errors.

```bash
heroku create --addons=heroku-postgresql,sendgrid,newrelic,rollbar --remote staging elixir-base-example --buildpack "https://github.com/HashNuke/heroku-buildpack-elixir.git"
heroku config:add HOST="elixir-base-example.herokuapp.com"
git push staging master
heroku open
```

## Credits

Elixir base was written and maintained by by [Flatstack](http://www.flatstack.com) with the help of our
[contributors](http://github.com/fs/elixir-base/contributors).

[<img src="http://www.flatstack.com/logo.svg" width="100"/>](http://www.flatstack.com)
