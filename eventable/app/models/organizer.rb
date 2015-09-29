class Organizer < ActiveRecord::Base
  has_secure_password 
  has_one :event
end
