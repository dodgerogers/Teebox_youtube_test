class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :oauth_token
      t.string :picture
      t.datetime :oauth_expires_at
      t.string :gender
      t.string :country

      t.timestamps
    end
    add_index :users, [:name, :id, :email]
  end
end
