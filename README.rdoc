# Serially-Demo

This is a simple demo app the demonstrates how [Serially gem][1] can be used to run background tasks serially in a scope of an instance.

## Installation

    $ bundle

The follwoing generates a migration that creates `serially_task_runs` table, which would be used to write the results of all your task runs.

    $ rails generate serially:install
    $ rake db:migrate

## Usage
All the commands should be executed from the app derectory:

### Run
Run web-server:
    $ rails s
Make sure redis is installed and running (it is needed for resque):
    $ redis-cli ping   # should return PONG
If redis isn't installed, get it [here][2]
Run resque:
    # this will start 3 workers that will listen to all queues
    $ bundle exec rake resque:workers QUEUE='*' COUNT=3
Go to localhost:3000, create a new post, and click the `schedule_serially` link next to it

### Monitor
Go to localhost:3000/resque to see a Serially::Worker job being added to `serially` queue every time you click `schedule_serially`
Monitor the resque log to see what's going on:
    $ tail -f ./log/resque.log
After all jobs finish, refresh localhost:3000, and you should see the results (which are read from `serially_task_runs` table)


[1]: https://github.com/mikemarsian/serially
[2]: http://redis.io/