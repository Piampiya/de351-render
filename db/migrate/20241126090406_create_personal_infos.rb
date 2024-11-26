class CreatePersonalInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_infos do |t|
      t.string :gender
      t.integer :age
      t.string :country
      t.string :goal
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
