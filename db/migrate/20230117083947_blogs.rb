class Blogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :blog_title
      t.string :blog_descp
      t.timestamps
    end
  end
end
