module NewsHelper
  def tags_by_new_id(new_id)
    new = New.find(new_id).tags.split(/\s*,\s*/).map(&:to_s).map{ |tag| (link_to tag, '#')  }.join(', ').html_safe
  end

  def have_permissions_news(user_id)
    current_user && can?('moderate_news')
  end

  def active_news?
    'active' if controller_name == 'news'
  end
end
