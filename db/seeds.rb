# coding: utf-8

Role.create(:name => 'Admin')
Role.create(:name => 'Photographer')
Role.create(:name => 'Customer')

User.create(
    :name => 'admin',
    :second_name => 'visual-cult',
    :login => 'admin',
    :password => 'admin123',
    :email => 'arravola@gmail.com',
    :phone => '89046106771',
    :birthday => '1987-09-29'.to_date.to_formatted_s(:db),
    :city => 'Msc'
)
User.find(1).roles << Role.find_by_name('Admin')
User.find(1).roles.delete(Role.find_by_name('Customer'))

Color.create(:name => 'Красный')
Color.create(:name => 'Синий')
Color.create(:name => 'Желтый')
Color.create(:name => 'Белый')
Color.create(:name => 'Черный')
Color.create(:name => 'Зеленый')
