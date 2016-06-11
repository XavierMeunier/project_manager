class ChangeLocationOnProjects < ActiveRecord::Migration
  def up
    add_column      :projects, :address,    :text
    remove_columns  :projects, :latitude
    remove_columns  :projects, :longitude
  end

  def down
    remove_columns  :projects, :address
    add_column      :projects, :latitude,   :decimal
    add_column      :projects, :longitude,  :decimal
  end

end
