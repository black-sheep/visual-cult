module NewsHelper
  def tags_by_new_id(new_id)
    new = New.find(new_id).tags.split(/\s*,\s*/).map(&:to_s).map{ |tag| (link_to tag, '#')  }.join(', ').html_safe
  end
end
