class AddPersonalInfoToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :personal_info, foreign_key: true
  end
end
