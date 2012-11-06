class CreateDecors < ActiveRecord::Migration
  def change
    create_table :decors do |t|
      t.string :name

      t.timestamps
    end
  end
end
