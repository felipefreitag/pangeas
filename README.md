# Pangeas

[![CircleCI](https://circleci.com/gh/felipefreitag/pangeas.svg?style=svg)](https://circleci.com/gh/felipefreitag/pangeas) [![codecov](https://codecov.io/gh/felipefreitag/pangeas/branch/master/graph/badge.svg)](https://codecov.io/gh/felipefreitag/pangeas) [![Code Climate](https://codeclimate.com/github/felipefreitag/pangeas/badges/gpa.svg)](https://codeclimate.com/github/felipefreitag/pangeas)

## Installation

### Install Dependencies

#### 1. Install PostgreSQL

[PostgreSQL](http://postgresql.org/)

#### 2. Install Rbenv

Rbenv: [repo](https://github.com/rbenv/rbenv)

- Check that the rbenv PATH is configured correctly, according to the repo instructions.

#### 3. Install Rbenv-gemset

Rbenv-gemset: [repo](https://github.com/jf/rbenv-gemset)

#### 4. Install ruby 2.4.1
```
$ rbenv install 2.4.1
```

If rbenv complains you don't have that ruby version, upgrade [ruby-build](https://github.com/rbenv/ruby-build#readme).

### Setup the project

#### Clone the repository
```
$ git clone git@github.com:felipefreitag/pangeas.git
$ cd pangeas
```

#### Install local bundler
Make sure you're running the correct ruby version. Run:

```
rbenv versions
```
It should return something like:
```
system
...(other ruby versions installed)...
* 2.4.1 (set by /home/<path-to-repo-folder>/pangeas/.ruby-version)

```
Make sure you're using the correct gemset. Run:
```
rbenv gemset active
```
It should return:
```
.gems global
```

If both are ok, run:
```
$ gem install bundler
```
Verify that the bundler was installed inside `pangeas/.gems` folder.


#### Install dependencies
Always use this command to ensure the gems are installed in `.gems`.
```
$ bin/bundle
```

Install javascript dependencies:
```
$ npm install
```

#### Set the env vars
```
$ cp .env.sample .env
```
Ask a colleague for the values.

#### Prepare the database
```
$ bin/rails db:create db:migrate db:seed
```

## Running the server
```
$ bin/rails s
```

You can check that it worked by browsing `localhost:3000`.

## Tests
```
$ bin/rspec
```
The coverage will be available on the `coverage/` folder. Open `coverage/index.html` on your browser to see details.


#### Running the linter
```
$ bin/rubocop
```

## Deployment

```
$ git push heroku master
```
