# Rails Treinamento

Rails app template for Codus training

[![coverage report](http://git.dev.codus.com.br/emiliano.leite/rails-treinamento/badges/master/coverage.svg)](http://git.dev.codus.com.br/emiliano.leite/rails-treinamento/commits/master)

## Setup

* Check if you have PostgreSQL installed:

```bash
$ psql --version
# psql (PostgreSQL) 9.6.
```

* Check if you have Redis installed:

```bash
$ redis-server -v
# Redis server v=3.2.8 sha=00000000:0 malloc=libc bits=64 build=b533f811ec736a0c
```

* Install PostgreSQL if necessary

  * [macOs](https://postgresapp.com/)
  * [ubuntu](https://www.digitalocean.com/community/tutorials/como-instalar-e-utilizar-o-postgresql-no-ubuntu-16-04-pt)

* Install [redis](https://redis.io/) if necessary

* Start up postgres and redis

* Being in project root, run:

```bash
rvm install ruby-2.4.2
rvm use
gem install bundle
bin/setup
```

* To check if everything went smoothly, run:

```bash
$ rspec
```

and

```bash
$ rails s
```

and, in your browser, navigate to `localhost:3000`

* Finally, reset the project's git:

```bash
rm -rf ./.git
git init
git add -A
git commit -m "Initial Commit"
```
