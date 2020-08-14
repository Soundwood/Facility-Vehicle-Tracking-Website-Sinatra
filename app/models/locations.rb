class Location < ActiveRecord::Base
    has_many :vehicles
    belongs_to :user
end