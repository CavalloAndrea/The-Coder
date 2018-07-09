class AddLanguageToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :java, :string
    add_column :users, :python, :string
    add_column :users, :c, :string
    add_column :users, :assembly, :string
    add_column :users, :sql, :string
    add_column :users, :html, :string
    add_column :users, :javascript, :string
    add_column :users, :css, :string
  end
end
