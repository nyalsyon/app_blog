class AddCommentIdInArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :comment_id, :integer
  end
end
