class Schedule < ApplicationRecord
  belongs_to :operator
  belongs_to :guest
  belongs_to :invite
end
