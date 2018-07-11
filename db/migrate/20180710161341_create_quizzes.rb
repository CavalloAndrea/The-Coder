class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :titolo
      t.string :d1
      t.string :d2
      t.string :d3
      t.string :d4
      t.string :d5
      t.string :g1
      t.string :g2
      t.string :g3
      t.string :g4
      t.string :g5
      t.string :r1_1
      t.string :r1_2
      t.string :r1_3
      t.string :r2_1
      t.string :r2_2
      t.string :r2_3
      t.string :r3_1
      t.string :r3_2
      t.string :r3_3
      t.string :r4_1
      t.string :r4_2
      t.string :r4_3
      t.string :r5_1
      t.string :r5_2
      t.string :r5_3
      t.references :tutorial, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
