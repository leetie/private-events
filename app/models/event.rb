class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :attendees, class_name: "User", association_foreign_key: "user_id"
  validates :title, :description, presence: true

  scope :previous_events, -> { where("date < ?", Time.now)}
  scope :upcoming_events, -> { where("date > ?", Time.now)}
  
  #redundant with scope
  # def self.past
  #   self.where("date < ?", Time.now)
  # end

  # def self.upcoming
  #   self.where("date > ?", Time.now)
  # end
end
