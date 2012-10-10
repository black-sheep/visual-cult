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

end
