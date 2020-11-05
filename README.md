# Instatalk

The Application in which the online chat function is implemented using the action cable.
The ability to track users s also made.
Users can create rooms and exchange messages.
Background tasks are handled using Redis. 
The data serializer is used to prepare data transmission through the channel.
An example of how it works can be viewed at heroku - [aconlinechat.herokuapp.com](aconlinechat.herokuapp.com).


## Requirements

ruby '2.7.0'

rails '~> 5.1.4'

A complete list of gems used is specified in the Gemfile

## Getting started

Download or clone repo

Use bundler (skip gems needed only in production)
```
bundle install --without production
```

Run database migrations
```
bundle exec rails db:migrate
```

Launch Rails server 
```
bundle exec rails s
```

Open `http://localhost:3000` in your browser
