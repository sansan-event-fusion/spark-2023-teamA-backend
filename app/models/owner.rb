class Owner < ApplicationRecord
    has_secure_password

    validates :email, presence: true
    validates :status, presence: true
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :phone_number, presence: true,  format: { with: /\A0\d{1,4}-\d{1,4}-\d{3,4}\z/, message: "は正しい形式で入力してください" }

    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end