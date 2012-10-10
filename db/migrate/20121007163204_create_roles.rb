class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end

    Role.create(:name => 'Admin')
    Role.create(:name => 'Photographer')
    Role.create(:name => 'Customer')

  end
end
