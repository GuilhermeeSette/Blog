module PostsHelper
  def calculate_time_ago(created_at_post)
    time_now = Time.now
    time_now.day - created_at_post.day
  end
end
