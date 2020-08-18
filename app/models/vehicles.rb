class Vehicle < ActiveRecord::Base
    validates :vin, presence: true
    validates :vin, uniqueness: true
    validates :model, presence: true
    validates :sub_model, presence: true
    validates :location_id, presence: true
    belongs_to :location
    belongs_to :user
    has_many :modifications
end