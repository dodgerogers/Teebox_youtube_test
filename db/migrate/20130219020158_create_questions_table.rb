class CreateQuestionsTable < ActiveRecord::Migration
  def up
    create_table :questions do |t|
        t.string :title
        t.string :body
        t.integer :user_id
        
        t.timestamps
      end
      add_index :questions, [:user_id, :title]
  end

  def down
      remove_index :questions, [:user_id, :title]
      drop_table :questions
  end
end
