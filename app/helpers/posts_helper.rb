module PostsHelper
  def schedule_link(post)
    link_to 'Schedule Serially Tasks', schedule_serially_post_path(post), method: :post
  end

  def generate_title
    Faker::Book.title
  end

  def generate_body
    Faker::Lorem.sentence
  end
end
