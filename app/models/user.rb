class User < ApplicationRecord
  has_many :invitations
  has_many :attended_event, through: :invitations, source: :event, dependent: :destroy
  has_many :events, foreign_key: :creator_id, class_name: 'Event', dependent: :destroy, inverse_of: 'creator'

  validates :name, presence: true, uniqueness: true
end
