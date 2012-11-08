module BlogsHelper
  def tags_by_blog_id(new_id)
    new = Blog.find(new_id).tags.split(/\s*,\s*/).map(&:to_s).map{ |tag| (link_to tag, '#')  }.join(', ').html_safe
  end
end
