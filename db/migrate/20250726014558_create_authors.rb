class CreateAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.date :birth_date
      t.string :nationality
      t.text :biography

      t.timestamps
    end
  end
end
