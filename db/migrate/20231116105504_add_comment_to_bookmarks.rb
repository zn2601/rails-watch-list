class AddCommentToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_column :bookmarks, :comment, :text
  end
end
