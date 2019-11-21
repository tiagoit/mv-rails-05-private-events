class User < ApplicationRecord
  # is owner of many events
  has_many :events

  # can attend to many events
  has_many :attendees
  has_many :attendances, through: :attendees, source: :event
end
