class ChangeLanguageToUser < ActiveRecord::Migration[5.1]
  
  def change
  	change_column :users, :java, :integer, default: 11
    change_column :users, :python, :integer, default: 21
    change_column :users, :c, :integer, default: 1
    change_column :users, :assembly, :integer, default: 31
    change_column :users, :sql, :integer, default: 41
    change_column :users, :html, :integer, default: 51
    change_column :users, :javascript, :integer, default: 71
    change_column :users, :css, :integer, default: 61
  end
  
end
