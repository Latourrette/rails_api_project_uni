class ChangeCompanies < ActiveRecord::Migration[5.2]
  def change
    change_table :companies do |t|
      t.rename :parish, :city
      t.string :path_image
      t.float :long
      t.float :lat
    end
  end
end
