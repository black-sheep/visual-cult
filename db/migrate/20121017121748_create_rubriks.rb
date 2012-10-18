class CreateRubriks < ActiveRecord::Migration
  def change
    create_table :rubriks do |t|
      t.string :name

      t.timestamps
    end
  end
end
