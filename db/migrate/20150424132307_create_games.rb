class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title, null:false
      t.references :developer
      t.timestamps null: false
    end


  end
end