class CreateStadiums < ActiveRecord::Migration[6.0]
  def change
    create_table :stadiums do |t|
      t.string :name
      t.string :location
      t.string :team
    end
  end
end
