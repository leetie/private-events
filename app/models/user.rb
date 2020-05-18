class User < ApplicationRecord
<<<<<<< HEAD
=======

  ##right now this is committing wrong value into events_users. it is putting in the value of the current event instead of the current user as the user_id 
  has_many :events, inverse_of: "creator"
  has_and_belongs_to_many :attended_events, foreign_key: "event_id", class_name: "Event"
  # has_and_belongs_to_many :attended_events, foreign_key: "attended_events", inverse_of: "attendee", class_name: "Event"
  #has many events as creator
  #belongs_to event as attendee
>>>>>>> 1ce535fc43d2ca10e9a777e7d1e1198157d32b93
end
