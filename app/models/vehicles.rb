class Vehicle < ActiveRecord::Base
    belongs_to :location
    has_many :modifications
end