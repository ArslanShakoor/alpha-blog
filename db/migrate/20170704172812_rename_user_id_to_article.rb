class RenameUserIdToArticle < ActiveRecord::Migration[5.1]
  def change
  	  rename_column :articles, :used_id, :user_id
  end
end
