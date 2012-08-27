class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.text :content, :null => false
      t.references :prompt, :null => false
      t.references :user, :null => false

      t.timestamps
    end
    add_index :poems, :prompt_id
    add_index :poems, :user_id
    add_index :poems, [:user_id, :prompt_id]
  end
end
