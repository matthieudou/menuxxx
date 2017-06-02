class AddCoordinatesToHookers < ActiveRecord::Migration[5.1]
  def change
    add_column :hookers, :latitude, :float
    add_column :hookers, :longitude, :float
  end
end
