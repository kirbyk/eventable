Eventable
=========

Make Apps. Not War.

Eventable is a web application that allows you to generate native iOS apps for
hackathons, conferences, and weddings.

Installation
------------

```bash
$ gem install rails
$ brew install redis
$ npm install -g cordova ionic ios-sim
$ cordova platform add ios
$ bundle install
$ rake db:migrate
```

Deployment
----------

```bash
$ rails s
$ redis-server
$ bundle exec sidekiq
$ browser http://localhost:3000
```

Troubleshooting
---------------

Sometimes the iOS emulator gets stuck at a black screen. Go up to Simulator at
the top of the screen and click Reset Content and Settings.

Also, clicking Build App within the webapp is a lot faster if the simulator is
already running:)
