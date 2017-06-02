class AddAddressToHookers < ActiveRecord::Migration[5.1]
  def change
    add_column :hookers, :address, :string
  end
end
