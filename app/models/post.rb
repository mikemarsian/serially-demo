class Post < ActiveRecord::Base
  include Serially

  serially in_queue: 'posts' do
    task :draft do |post|
      post.complete(:drafted_by)
      true
    end
    task :review
    task :publish
  end

  def review
    if rand > 0.5
      [false, 'No reviewer available']
    else
      self.complete(:reviewed_by)
      true
    end
  end

  def publish
    self.complete(:published_by)
    [true, 'Post published!']
  end


  def complete(action)
    name = Faker::Name.name
    self.update(action => name)
    puts "Post #{self.instance_id} #{action.to_s.humanize} #{name}"
  end
end
