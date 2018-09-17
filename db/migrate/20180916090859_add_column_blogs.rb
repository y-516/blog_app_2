class AddColumnBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs,:name,:string
    add_column :blogs,:email,:string
    add_column :blogs,:password_digest,:string

  end
end
