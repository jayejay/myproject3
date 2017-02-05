class AddMediumToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :medium, :string
  end
end
