class Category < ApplicationRecord
  has_many :posts, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
