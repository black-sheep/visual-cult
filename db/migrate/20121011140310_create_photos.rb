class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string  :name
      t.string  :src_preview
      t.string  :miniature_one
      t.string  :miniature_two
      t.date    :date_create
      t.integer :gallery_id
      t.string  :city
      t.boolean :sell
      t.string  :description
      t.integer :width
      t.integer :height
      t.integer :circulation_id
      t.integer :decor

      t.integer :technology_id
      t.integer :color_id
      t.integer :colord_id
      t.integer :rubrik_id
      t.integer :rubrikd_id

      t.integer :raiting

      t.timestamps
    end
  end
end
