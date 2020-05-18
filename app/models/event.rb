class Event < ApplicationRecord
<<<<<<< HEAD
  
=======

  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :attendees, class_name: "User", foreign_key: "attendee_id"
  #has_many attendees
  #belongs_to creator
>>>>>>> 1ce535fc43d2ca10e9a777e7d1e1198157d32b93
end
