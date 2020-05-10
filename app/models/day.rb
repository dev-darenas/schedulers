class Day < ApplicationRecord
  belongs_to :schedule
  validates_presence_of :reservation_date

end
