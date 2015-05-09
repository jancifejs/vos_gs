class CreateGameservers < ActiveRecord::Migration
  def change
    create_table :gameservers do |t|
      t.integer :port, null:false
      t.string :name, null:false
      t.string :ip, null:false
      t.references :game
      t.timestamps null: false
    end
  end
end
