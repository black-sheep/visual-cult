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

end
