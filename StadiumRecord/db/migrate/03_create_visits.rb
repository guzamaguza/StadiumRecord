class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.string :arena
      t.string :date
      t.integer :user_id
      t.integer :arena_id
    end
  end
end
