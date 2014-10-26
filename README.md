# imbers - backend

![imbers](http://f.cl.ly/items/0U2e0f2c0n2w013T3i15/logo.png)

imbers was made during the [ProductHunt Hackathon 2014](http://www.producthunt.com/). Vote for for us if you like what you see :)

## Requirements

- [Ruby 2.1.1](https://github.com/sstephenson/rbenv)
- [PostgreSQL 9.3.2](http://www.postgresql.org/)
- [Redis](http://www.redis.io/)
- [Neo4j](http://neo4j.com/)

## Resources

- [Coding style: Ruby](https://github.com/bbatsov/ruby-style-guide)
- [Coding style: Rails](https://github.com/bbatsov/rails-style-guide)
- [Coding style: Specs](http://betterspecs.org/)

## Getting started

#### 3rd party depednencies

Install [Docker](https://www.docker.com/) and [fig](http://www.fig.sh/) then:

```
$ fig up
```

This will fire up:

- PostgreSQL
- Neo4j test instance
- Neo4j dev instance
- Redis

#### Configurations

Sensitive data is stored in the `.env` file. Copy the sample file and edit it:

```
$ cp .env.sample .env
$ vi .env
```

| Key                | Description                                                     |
|:-------------------|:----------------------------------------------------------------|
| DATABASE_URL       | PostgreSQL URI                                                  |
| DATABASE_TEST_URL  | PostgreSQL URI for test environment                             |
| REDIS_URI          | Redis connection URI                                            |
| NEO4J_HOST         | Neo4j hostname                                                  |
| NEO4J_PORT         | Neo4j port                                                      |
| NEO4J_TEST_HOST    | Neo4j hostname for test environment                             |
| NEO4J_TEST_PORT    | Neo4j port                                                      |

#### Install dependencies

```
$ bundle install
```

#### Create the database and run the migrations:

```
$ rake db:create db:migrate
```

#### Insert seed data (optional)

```
$ rake db:seed
```

#### Start the server

```
$ foreman start
```

## Tests

- [RSpec](https://github.com/rspec/rspec)

Run all tests:

```
$ rspec
```

## Lint

```
$ rubocop
```

## License

MIT
