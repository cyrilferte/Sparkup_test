class CreateRejects < ActiveRecord::Migration[5.0]
  def change
    create_table :rejects do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :reason
      t.references :importation, foreign_key: true

      t.timestamps
    end
  end
end
