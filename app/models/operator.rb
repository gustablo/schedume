class Operator < ApplicationRecord
    has_many :invites
    has_many :schedules

    validates :email, presence: true
    validates :name, presence: true

    has_secure_password
end
