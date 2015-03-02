Testing
[![Code Climate](https://codeclimate.com/github/AgileVentures/Oodls/badges/gpa.svg)](https://codeclimate.com/github/AgileVentures/Oodls) [![Test Coverage](https://codeclimate.com/github/AgileVentures/Oodls/badges/coverage.svg)](https://codeclimate.com/github/AgileVentures/Oodls)

Oodls v2.0
==========
These are the preliminary docs for the Oodls project.
This is a reboot of a demo version: [github](https://github.com/Callisto13/Oodls) | [site](http://www.oodls.io/)

### About Oodls
Coming soon...


### Get Involved
Oodls is an open source charity project, so if you want to do something nice for nothing more than street cred, checkout our [pivotal tracker](https://www.pivotaltracker.com/n/projects/1280286), see the [plan thus far](https://github.com/Callisto13/new-oodls/blob/docs/plan.md), and fork this repo! We accept contributions from those of any skill level and, as an [Agile Ventures](http://www.agileventures.org/projects/oodls) project, welcome anyone who wants to learn.

To make regular contributions, communicate with the rest of the team and keep up with developments, head over to [Agile Ventures](http://agileventures.org), and sign up for a free account and an invitation to our [Slack](https://slack.com/) channel.

#### Contributing basics:
Oodls is a Ruby-based app running on [Sinatra](https://github.com/sinatra/sinatra). Our database is [PostgreSQL](http://www.postgresql.org/).
To get started:
  
  * make sure you have ruby stuff and postgres installed on your machine
  * create a project directory, with a remote to your github fork
  * branch off development (to whatever)
  * and then run the following commands:


~~~
  ... $ psql
~~~

This should take you into your database server where you can create your test & development databases;

~~~
  ... =# CREATE DATABASE "oodls_test";
  ... =# CREATE DATABASE "oodls_development";
  ... =# \q
~~~

After that from your project root run:

~~~
  ... $ bundle
  ... $ cucumber && rspec
~~~

Yes! That's correct, we test EVERYTHING at team Oodls. We also love pair programming and peer code reviews.

Therefore, these 'rules' apply to all contributors (please). All code you write MUST be TTD (unless you are tackling map-related JavaScript, which could be forgiven... maybe). If you break a test you didn't write, fix it before you push it up. The testing frameworks we use are [RSpec](https://github.com/rspec/rspec-core) & [Cucumber](https://github.com/cucumber/cucumber/wiki) (with some [Capybara](https://github.com/jnicklas/capybara)). If you want to use something else for your tests, go for it. Pull requests will not be merged if code is untested or those tests are red.

If you can, find someone to pair with, remotely or whatever - if you can't, make as much noise as possible about what you are doing/intend to do in the Oodls Slack channel.

And last, but not least: keep it neat. Refactor.

To see your stuff live, run:

~~~
  ... $ rackup
~~~

which will run the app on your local server, usually from port 9292.

When you are done, push your stuff to your github fork, ask some random on the team to take a look through your code, and submit a pull request.

Minor stuff will be merged in and deployed pretty much automatically (so long as test are passing, obvs). Major changes need a peer review as well before they go anywhere. Anyone on the team can do this, and reviewers just need to post in Slack when they are done.
