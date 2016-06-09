class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.decimal :latitude
      t.decimal :longitude
      t.integer :amount

      t.timestamps null: false
    end
  end
end
