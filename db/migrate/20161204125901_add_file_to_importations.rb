class AddFileToImportations < ActiveRecord::Migration[5.0]
  def change
    add_column :importations, :file, :string
  end
end
