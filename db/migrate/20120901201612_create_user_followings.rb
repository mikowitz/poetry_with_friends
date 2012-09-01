class CreateUserFollowings < ActiveRecord::Migration
  def change
    create_table :user_followings, id: false do |t|
      t.references :user, :null => false
      t.integer :followed_user_id, :null => false
      t.timestamps
    end

    add_index :user_followings, [:user_id, :followed_user_id], :unique => true
  end
end
