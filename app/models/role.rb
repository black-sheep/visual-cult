class Role < ActiveRecord::Base
  attr_accessible :name
  has_one :user

  permissions = {
                    :menu_user => true,
                    :menu_admin=> false
                    }

  def can

  end
end
