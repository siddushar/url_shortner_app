# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 3.0.0
* Rails version - 7.0.4

#### Installation

1. Clone the repository

    ```bash
    git clone https://github.com/siddushar/
    cd url_shortner_app
    ```

2. Install Gem dependencies

    ```bash
    bundle install
    ```

3. Set up local ClosedStack database

    ```bash
    # Create the database
    bundle exec rake db:setup RAILS_ENV=development
    # Run database migrations
    bundle exec rake db:migrate RAILS_ENV=development


## About
This app contains supports both UI application and backend-api
 1. UI-Application - http://localhost:3000/
    1. Signup - http://localhost:3000/users/sign_up
    2. Root page - http://localhost:3000
 2. API only - http://localhost:3000/api_docs/index.html - has Supports 3 API's
   #### Create user
   #### Login user and get access token
   #### Shorten url using access token
* ...
