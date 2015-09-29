class Event < ActiveRecord::Base
  belongs_to :organizer
  has_many :schedules, dependent: :destroy
  has_many :updates, dependent: :destroy
  has_many :prizes, dependent: :destroy
  has_many :people, dependent: :destroy
end
