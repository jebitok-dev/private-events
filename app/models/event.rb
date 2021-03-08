class Event < ApplicationRecord
  has_many :invitations
  has_many :attendees, through: :invitations, source: :user, dependent: :destroy
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  scope :past, -> { where('date < (?) ', Date.today) }
  scope :future, -> { where('date >= (?) ', Date.today) }

  # validates :event_name, presence: true
  # validates :description, presence: true
  # validates :location, presence: true
  # validates :date, presence: true
end
