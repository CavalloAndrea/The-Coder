class CreateEsercizis < ActiveRecord::Migration[5.1]
  def change
    create_table :esercizis do |t|
      t.text :titolo
      t.text :linguaggio
      t.text :testo
      t.text :soluzione
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
