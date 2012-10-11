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
end
