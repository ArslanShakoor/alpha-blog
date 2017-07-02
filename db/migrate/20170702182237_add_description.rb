class AddDescription < ActiveRecord::Migration[5.1]
  def change
  	add_column :articles, :description, :text
  	add_column :articles, :crated_at, :datetime
  	add_column :articles, :updated_at, :datetime
  end
end
