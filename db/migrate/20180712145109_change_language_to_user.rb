class ChangeLanguageToUser < ActiveRecord::Migration[5.1]
  
    def change
  	change_column :users, :java, :integer, default: 10
    change_column :users, :python, :integer, default: 20
    change_column :users, :c, :integer, default: 0
    change_column :users, :assembly, :integer, default: 30
    change_column :users, :sql, :integer, default: 40
    change_column :users, :html, :integer, default: 50
    change_column :users, :javascript, :integer, default: 70
    change_column :users, :css, :integer, default: 60
  end
end
