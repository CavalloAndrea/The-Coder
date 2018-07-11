class ChangeLanguageToUser < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :java, :integer
    change_column :users, :python, :integer
    change_column :users, :c, :integer
    change_column :users, :assembly, :integer
    change_column :users, :sql, :integer
    change_column :users, :html, :integer
    change_column :users, :javascript, :integer
    change_column :users, :css, :integer
  end
end
