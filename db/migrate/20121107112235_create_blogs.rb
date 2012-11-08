class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string  :title
      t.string  :text
      t.string  :tags
      t.string  :picture
      t.integer :user_id

      t.timestamps
    end
  end
end
