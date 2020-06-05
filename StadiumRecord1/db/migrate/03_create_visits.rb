class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.string :stadium
      t.string :date
      t.integer :user_id
    end
  end
end
