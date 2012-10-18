module PhotosHelper
  def gallery(gallery_id, gallery_name, user_id)
    if gallery_name != ''
      gallery = User.find(user_id).galleries.find_by_name(gallery_name)
      if gallery.nil?
        gallery = User.find(user_id).galleries.create(:name => gallery_name)
      end
    else
      gallery = User.find(user_id).galleries.find(gallery_id) unless gallery_id.nil?
    end
  end

  def str_to_links(str)
    str.split(/\s*,\s*/).map(&:to_s).map{ |tag| (link_to tag, '#')  }.join(', ').html_safe
  end

  def get_rubriks_and_tech(*obj)
    # :TODO Доделать для фотографии show раздел и техники

    # :TODO Сделать photo->raiting default => 0

    # :TODO Спросить о модерации
    # :TODO Сделать меню
  end
end
