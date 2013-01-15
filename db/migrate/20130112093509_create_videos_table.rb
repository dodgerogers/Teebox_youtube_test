class CreateVideosTable < ActiveRecord::Migration
  def up
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :yt_video_id
      t.boolean :is_complete, default: false
      t.boolean :public, default: true
      t.integer :user_id
      t.string :youtube_url
      t.timestamps
    end
    add_index :videos, [:title, :public, :user_id]
  end

  def down
    remove_index :videos, [:title, :public, :user_id]
    drop_table :videos
  end
end
