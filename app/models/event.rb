class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'

    validates :event_name, presence: true
    validates :description, presence: true
    validates :location, presence: true
    validates :date, presence: true
end
