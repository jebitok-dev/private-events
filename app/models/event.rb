class Event < ApplicationRecord
  serialize :event, Array
  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations, source: :event_creator
  belongs_to :creator, class_name: 'User'

  scope :past, ->(date = Date.today.to_s) { where('date < ?', date) }
  scope :upcoming, ->(date = Date.today.to_s) { where('date >= ?', date) }

  validates :event, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :descriptiom, presence: true
end
