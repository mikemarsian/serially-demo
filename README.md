# Serially-Demo

This is a simple demo app the demonstrates how [Serially gem][1] can be used to schedule background tasks to run serially, strictly one after another, in a scope of an instance.

## Installation

    $ bundle

The following generates a migration that creates `serially_task_runs` table, which would be used to write the results of all your task runs.

    $ rails generate serially:install
    $ rake db:migrate

## Usage
All the commands should be executed from the app directory:

### Run
1. Run web-server:

    $ rails s

2. Make sure redis is installed and running (it is needed for resque):

    $ redis-cli ping   # should return PONG

3. If redis isn't installed, get it [here][2]

4. Run resque:

    # this will start 3 workers that will listen to all queues
    $ bundle exec rake resque:workers QUEUE='*' COUNT=3

5. Go to _localhost:3000_, create a new post, and click the _Schedule Serially Tasks_ link next to it. For the sake of an experiment,
you can click the link multiple times, the Serially tasks for each post will still run only once.

### View Results
1. Give it 30 seconds, refresh _localhost:3000_, and you should see the columns 'Drafted by', 'Reviewed by', and 'Published By' filled

### Monitor
1. Go to _localhost:3000/resque_ to see a Serially::Worker job being added to `serially` queue every time you click _Schedule Serially Tasks_
2. Monitor the resque log to see what's going on:

    $ tail -f ./log/resque.log



[1]: https://github.com/mikemarsian/serially
[2]: http://redis.io/