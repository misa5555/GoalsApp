class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.text :body
      t.string :permission
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
