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

      t.integer :edition_one
      t.integer :edition_two
      t.integer :edition_three

      t.integer :size_one
      t.integer :size_two
      t.integer :size_three
      t.integer :price_one
      t.integer :price_two
      t.integer :price_three
      t.integer :decor_one
      t.integer :decor_two
      t.integer :decor_three


      t.integer :technology_id
      t.integer :color_id
      t.integer :colord_id
      t.integer :rubrik_id
      t.integer :rubrikd_id

      t.string  :tags

      t.integer :raiting

      t.timestamps
    end
  end
end
