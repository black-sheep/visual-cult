class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end

    create_table :permissions_roles, id: false do |t|
      t.integer :role_id, :permission_id, null: false
    end

    create_table :roles_users, id: false do |t|
      t.integer :role_id, :user_id, null: false
    end

    add_index :permissions_roles, [:role_id, :permission_id], name: :permissions_roles_idx
    add_index :roles_users, [:role_id, :user_id], name: :roles_users_idx

    Role.create(:name => 'Admin')
    Role.create(:name => 'Photographer')
    Role.create(:name => 'Customer')

  end
end
