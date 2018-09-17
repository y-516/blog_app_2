class AddIndexToBlogsEmail < ActiveRecord::Migration[5.1]
  def change
    add_index:blogs,:email,unique:true
  end
end
