class AddUserIdInArticles < ActiveRecord::Migration[5.1]
  def change
  	add_column :articles, :used_id, :integer
  end
end
