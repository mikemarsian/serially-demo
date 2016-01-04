# Serially-Demo

This is a rails demo app the demonstrates how [Serially gem][1] can be used to orchestrate background tasks to run serially, one after another, for instances of a model.

## Installation

    $ bundle

The following generates a migration that creates `serially_task_runs` table, which would be used to write the results of all your task runs.

    $ rails generate serially:install
    $ rake db:migrate

For resque, you'll need to make sure that redis is installed and running:

    $ redis-cli ping   # should return PONG

If redis isn't installed, get it [here][2]

## Usage

### Run

Run web-server:
```
    $ rails s
```
Run resque
```
    # this will start 3 resque workers that will listen to the 'posts' queue
    $ bundle exec rake resque:workers QUEUE='posts' COUNT=3 TERM_CHILD=1
```
Go to _localhost:3000_, create a new post, and click the _Schedule Serially Tasks_ link next to it. For the sake of an experiment,
you can click the link multiple times, the tasks for the post will still run only once.

### View Results

Give it 15 seconds, refresh _localhost:3000_, and you should see the columns _Drafted by_, _Reviewed by_, and _Published By_ filled with values.
_Last task_ columns display info on the last task that ran for each post.

### Monitor

* Go to _localhost:3000/resque_ to see a job being added to `serially` queue for every post on which you click _Schedule Serially Tasks_
* Monitor the resque log to see what's going on:
```
    $ tail -f ./log/resque.log
```

[1]: https://github.com/mikemarsian/serially
[2]: http://redis.io/