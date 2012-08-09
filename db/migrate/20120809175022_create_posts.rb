class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |table|
      table.string :title, null: false
      table.string :path, null: false
    end

    add_index :posts, :title
    add_index :posts, :path

    create_table :statistics do |table|
      table.integer :post_id
      table.string  :source, null: false
      table.date    :start_date, null: false
      table.date    :end_date, null: false
      table.integer :visit_count
    end

    add_index :statistics, :post_id
  end
end
