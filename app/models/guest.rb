class Guest < ApplicationRecord
    has_many :invites
    has_many :schedules

    validates :email, presence: true
    validates :name, presence: true
end
