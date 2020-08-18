
# flatiron-sinatra-project - Facility Vehicle Tracking

This Sinatra program is intended to keep track of vehicles and work bays (locations) within a manufacturing facility. Generally the system is built on the assumption that the data is gathered by another resource, though tools have been added for standard CRUD operations. The system could be expanded to provide visual representations of vehicle locations as well as data analysis of KPIs.

## Installation

Fork and clone this repository

And then execute:

    $ bundle install

Migrate and Seed the Database:

    $ rake db:migrate
    $ rake db:seed

Run locally:

    $ shotgun

Access from browser:

    Copy the 'listening on' IP address to browser and hit enter
    CTRL+C to stop shotgun

## Usage

Users can create signup credentials and use them to login. Any request to access information behind the login screen will reroute the user to the login/signup screen. Users can CRUD vehicles and locations. 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Soundwood/flatiron-sinatra-project/. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/soundwood/flatiron-sinatra-project/blob/master/CODE_OF_CONDUCT.md).
