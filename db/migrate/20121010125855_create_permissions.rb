class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name

      t.timestamps
    end

    add_index :permissions, :name, :unique => true

    # :TODO Передалать права в разделе новости
    # news permissions
    Permission.create(:name => 'create_news')
    Permission.create(:name => 'update_news')
    Permission.create(:name => 'destroy_news')
    Permission.create(:name => 'moderate_news')

    # galleries permissions
    Permission.create(:name => 'create_galleries')
    Permission.create(:name => 'update_galleries')
    Permission.create(:name => 'destroy_galleries')
    Permission.create(:name => 'moderate_galleries')
    #photoes permissions

    # admin permissions
    Role.find(1).permissions << Permission.find_by_name('create_news')
    Role.find(1).permissions << Permission.find_by_name('update_news')
    Role.find(1).permissions << Permission.find_by_name('destroy_news')

    Role.find(1).permissions << Permission.find_by_name('create_galleries')
    Role.find(1).permissions << Permission.find_by_name('moderate_galleries')
    Role.find(1).permissions << Permission.find_by_name('update_galleries')
    Role.find(1).permissions << Permission.find_by_name('destroy_galleries')



    User.create(
                :name => 'admin',
                :second_name => 'admin',
                :login => 'admin',
                :password => 'admin123',
                :email => 'arravola@gmail.com',
                :phone => '89046106771',
                :birthday => '1987-09-29'.to_date.to_formatted_s(:db),
                :city => 'Msc'
                )
    User.find(1).roles << Role.find_by_name('Admin')
    User.find(1).roles.delete(Role.find_by_name('Customer'))

  end
end
