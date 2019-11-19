class Event < ApplicationRecord
  belongs_to :user
  has_many :atendees
  # has_many :users, through: :attendees

  # has_and_belongs_to_many :users
end
