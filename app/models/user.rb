class User < ApplicationRecord
  has_many :events, inverse_of: "creator"
  validates :name, :username, presence: true

  #forgot 'inverse_of:' before? was getting empty association for attendees on Event end...
  has_and_belongs_to_many :attended_events, association_foreign_key: "event_id", class_name: "Event", inverse_of: "attendee"
end
