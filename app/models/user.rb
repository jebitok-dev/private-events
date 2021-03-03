class User < ApplicationRecord
    # has_many :invited_events, foreign_key: :event_creator_id
    # has_many :created_events, through: :invited_events
    has_many :created_events, class_name: 'Event'
    
    validates :name, presence: true, uniqueness: true
end
