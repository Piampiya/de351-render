class PersonalInfo < ApplicationRecord
  belongs_to :user, inverse_of: :personal_info
  validates :gender, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :country, presence: true
  validates :goal, presence: true
end
