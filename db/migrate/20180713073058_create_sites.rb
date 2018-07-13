class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.boolean :sospeso

      t.timestamps
    end
  end
end
