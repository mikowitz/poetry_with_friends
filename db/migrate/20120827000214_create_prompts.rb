class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.text :content, :null => false
      t.references :user, :null => false
      t.timestamps
    end
  end
end
