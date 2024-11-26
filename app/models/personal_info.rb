class PersonalInfo < ApplicationRecord
  belongs_to :user, inverse_of: :personal_info
  validates :gender, presence: true
  validates :age, presence: true
  validates :country, presence: true
  validates :goal, presence: true
end
