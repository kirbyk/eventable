Eventable
=========

Make apps. Not War.

Eventable is a web application that allows you to generate native iOS apps for
hackathons, conferences, and weddings.

Installation
------------

```bash
$ gem install rails
$ npm install -g cordova ionic ios-sim
$ bundle install
$ rake db:migrate
```

Deployment
----------

```bash
$ rails s
$ cd lib/hackathon-template && ionic serve
$ browser http://localhost:3000
```
