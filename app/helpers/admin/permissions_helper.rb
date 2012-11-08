module Admin::PermissionsHelper
  def checked?(role_id, permission_id)
    Role.find(role_id).permissions.exists?(Permission.find(permission_id))
  end

  def select_role?(user_id, role_id)
    User.find(user_id).roles.exists?(Role.find(role_id))
  end
end
