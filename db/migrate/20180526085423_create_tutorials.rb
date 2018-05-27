class CreateTutorials < ActiveRecord::Migration[5.1]
  def change
    create_table :tutorials do |t|
      t.text :titolo
      t.text :lezione
      t.text :linguaggio
      t.text :quiz

      t.timestamps null: false
    end
  end
end
