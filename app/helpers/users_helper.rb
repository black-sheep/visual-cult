module UsersHelper
  def user_avatar(user)
    if File.exists?(user.avatar.url.to_s)
      user.avatar.url
    else
      'placeholder/placeholder.jpg'
    end
  end
end
