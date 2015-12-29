module PostsHelper
  def schedule_link(post)
    link_to 'Schedule Serially Tasks', schedule_serially_post_path(post), method: :post
  end
end
