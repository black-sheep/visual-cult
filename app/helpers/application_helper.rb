module ApplicationHelper
  def logo
    image_tag("i/logo.png", :alt => "Begovel")
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def can?(*permission_name)
    current_user && permission_name.inject(false) { |acc, pn| acc || current_user.can?(pn) }
  end

  def have_permissions_controller(user_id)
    action_name_helper = action_name
    action_name_helper = 'create' if action_name == 'new'
    action_name_helper = 'update' if action_name == 'edit'

    current_permission  = action_name_helper + '_' + controller_name

    if (current_user && can?(current_permission) && current_user.id == user_id) || (current_user && can?('moderate_' + controller_name))
      permissions = true
    else
      permissions = false
    end
  end

  def top_menu
    if ['galleries', 'photos'].include?(controller_name)
      render 'layouts/menus/auth_top_menu'
    elsif controller_name == 'users' && action_name != 'index'
      render 'layouts/menus/auth_top_menu'
    else
      render 'layouts/menus/top_menu'
    end
  end

  def get_filter
    unless ['users', 'galleries'].include?(controller_name)
      render 'layouts/menus/filter'
    end
  end
end
