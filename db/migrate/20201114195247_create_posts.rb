class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :body, null: false
      #t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
    add_foreign_key :posts, :users, column: :user_id
  end
end
