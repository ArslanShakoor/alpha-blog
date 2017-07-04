class AddUserIdToArticles < ActiveRecord::Migration[5.1]
  def change
  	add_coulmn: articles, :used_id, :integer
  end
end
