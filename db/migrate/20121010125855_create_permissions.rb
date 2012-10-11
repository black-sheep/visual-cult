class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name

      t.timestamps
    end

    Role.find_by_name('Admin').permissions.create(:name => 'create_news')
    Role.find_by_name('Admin').permissions.create(:name => 'edit_news')
    Role.find_by_name('Admin').permissions.create(:name => 'delete_news')

  end
end
