class Invite < ApplicationRecord
  belongs_to :operator
  belongs_to :guest
  
  has_one :schedules

end
