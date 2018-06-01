class AddInfoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :eta, :string
    add_column :users, :sesso, :string
    add_column :users, :istruzione, :string
    add_column :users, :linguaggi, :string, array: true,default: []
  end
end
