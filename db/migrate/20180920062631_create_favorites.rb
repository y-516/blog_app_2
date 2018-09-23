class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :blog_id
      t.references :user, foreign_key: true
      t.references :blog, foreign_key: true
      t.timestamps
    end
  end
end
