class CreateUsers < ActiveRecord::Migration

  def change
    create_table :users do |table|
      table.string :name
    end

    add_column :posts, :user_id, :integer
    add_index :posts, :user_id
    add_index :users, :name
  end

end
