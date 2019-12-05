class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change    
    add_reference :articles, :user, index: true, foreign_key: true    
  end
end
