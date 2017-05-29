class CreateHookers < ActiveRecord::Migration[5.1]
  def change
    create_table :hookers do |t|
      t.string :name
      t.string :city
      t.string :street
      t.integer :postal_code
      t.integer :street_nr
      t.text :short_description
      t.text :long_description
      t.float :price
      t.references :user, foreign_key: true
      t.string :profile_picture

      t.timestamps
    end
  end
end
