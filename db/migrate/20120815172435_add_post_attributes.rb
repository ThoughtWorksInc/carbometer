class AddPostAttributes < ActiveRecord::Migration

  def change
    add_column :posts, :published_at, :time
  end

end
