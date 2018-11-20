class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :contact
      t.string :address
      t.string :parish
      t.string :postalCode

      t.timestamps
    end
  end
end
