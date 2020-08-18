
# flatiron-sinatra-project - Facility Vehicle Tracking

This Sinatra program is intended to keep track of vehicles and work bays (locations) within a manufacturing facility. Generally the system is built on the assumption that the data is gathered by another resource, though tools have been added for standard CRUD operations. The system could be expanded to provide visual representations of vehicle locations as well as data analysis of KPIs.

## Installation

Fork and clone this repository

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install music_video_finder

Migrate and Seed the Database

    $ rake db:migrate
    $ rake db:seed

## Usage

Users can create signup credentials and use them to login. Any request to access information behind the login screen will reroute the user to the login/signup screen. Users can CRUD vehicles and locations. 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Soundwood/flatiron-sinatra-project/. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/soundwood/flatiron-sinatra-project/blob/master/CODE_OF_CONDUCT.md).
