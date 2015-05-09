class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :name, null:false
      t.timestamps null: false
    end
  end
end