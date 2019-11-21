class Event < ApplicationRecord
  ################################################### relations ########################################################
  belongs_to :user

  has_many :attendees
  has_many :users, through: :attendees

  #################################################### scopes ##########################################################
  scope :previous_events, -> { where('date < ?', Time.now) }
  scope :next_events, -> { where('date > ?', Time.now) }
end
