class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end

    create_table :roles_users, id: false do |t|
      t.integer :role_id, :user_id, null: false
    end

    add_index :roles_users, [:role_id, :user_id], name: :roles_users_idx
    add_index :roles, :name, :unique => true
  end
end
