class User < ApplicationRecord
    has_many :invitations, foreign_key: :atendee_id
    has_many :attended_events, through: :invitations
    has_many :events, class_name: 'Event'
    
    validates :name, presence: true, uniqueness: true
end
