class CreateProblems < ActiveRecord::Migration[5.1]
  def change
    create_table :problems do |t|
      t.varchar :titolo
      t.varchar :linguaggio
      t.varchar :esercizio
      t.varchar :soluzione
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
