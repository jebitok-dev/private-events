class Event < ApplicationRecord
    has_many :event_invitations, foreign_key: :invited_event_id
    has_many :creators, through: :invited_events, source: :event_creator
    belongs_to :creator, foreign_key: "creator_id", class_name: 'User'

  validates :event, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :invite, presence: true
end
