class RenameMediumInProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :medium, :mediums
  end
end
