class Event < ApplicationRecord
    has_many :invitations, foreign_key: :attended_event_id
    has_many :atendees, through: :invitations
    belongs_to :creator, class_name: 'User'

    scope :show, ->(events = events.user_id) {where('events.user_id = ?', user_id)}

    validates :event_name, presence: true
    validates :description, presence: true
    validates :location, presence: true
    validates :date, presence: true
end
