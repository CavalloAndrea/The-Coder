class AddNextToTutorial < ActiveRecord::Migration[5.1]
  def change
    add_column :tutorials, :next, :integer
  end
end
