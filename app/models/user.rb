class User < ApplicationRecord
  has_many :events
  has_many :attendees
  has_many :events, through: :attendees
end
