class User < ApplicationRecord
  has_many :events
  has_many :atendees
  # has_many :events, through: :attendees

  # has_and_belongs_to_many :events
end
