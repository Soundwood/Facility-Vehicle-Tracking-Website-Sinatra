class Location < ActiveRecord::Base
    validates :station, presence: true
    validates :building, presence: true
    has_many :vehicles
    belongs_to :user
end