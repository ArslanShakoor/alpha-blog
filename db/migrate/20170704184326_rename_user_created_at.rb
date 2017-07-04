class RenameUserCreatedAt < ActiveRecord::Migration[5.1]
  def change
  	  rename_column :articles, :crated_at, :created_at

  end
end
