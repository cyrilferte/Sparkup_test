class CreateImportations < ActiveRecord::Migration[5.0]
  def change
    create_table :importations do |t|

      t.timestamps
    end
  end
end
