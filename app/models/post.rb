class Post < ActiveRecord::Base
  include Serially

  serially do
    task :draft do |post|
      post.complete(:drafted_by)
      true
    end
    task :review
    task :publish
  end

  def review
    self.complete(:reviewed_by)
    true
  end

  def publish
    self.complete(:published_by)
    true
  end

  def complete(action)
    name = Faker::Name.name
    self.update(action => name)
    puts "Post #{self.instance_id} #{action.to_s.humanize} #{name}"
  end
end
